//
//  INetworkService.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

protocol INetworkService {
    func fetch<T:Codable> (baseUrl: String, route: String, method: HTTPMethod, type: T.Type, parameters: Parameters?, completionHandler: @escaping (Result<T, Error>) -> Void)
}

class RemoteNetworkService: INetworkService {
    
    func fetch<T: Codable>(baseUrl: String, route: String, method: HTTPMethod, type: T.Type, parameters: Parameters? = nil, completionHandler: @escaping (Result<T, Error>) -> Void) {
        let urlString = "\(baseUrl)\(route)"
        
        Logger.printIfDebug(data: "BASE URL: \(urlString)", logType: .info)
        
        guard let url = urlString.asURL else {
            Logger.printIfDebug(data: "unable to get url", logType: .error)
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: 10)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("\(Constants.ApiHelper.authorizationKey ?? "")", forHTTPHeaderField: "X-Auth-Token")
        request.httpMethod = method.rawValue
        
        if let parameters = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = parameters.map {
                    URLQueryItem(name: $0, value: "\($1)")
                }
                request.url = urlComponent?.url
            case .post, .delete, .patch, .head, .put:
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                request.httpBody = bodyData
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(.failure(error))
                    Logger.printIfDebug(data: "\(error), \(error.localizedDescription)", logType: .error)
                    return
                }
                
                guard let data = data else {
                    completionHandler(.failure(NetworkError.invalidData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: data)
                    completionHandler(.success(response))
                } catch {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        Logger.printIfDebug(data: "Received JSON: \(jsonString)", logType: .error)
                    }
                    Logger.printIfDebug(data: "Decoding error: \(error)", logType: .error)
                    completionHandler(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
