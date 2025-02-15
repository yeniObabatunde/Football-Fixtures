//
//  FixturesRepository.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation


protocol IFixturesRepository {
    func getTodaysFixtureList(completion: @escaping (Result<FootbalFixtureModel, Error>) -> Void)
    func getCompetitioList(completion: @escaping (Result<CompetitionModel, Error>) -> Void)
    func getCompetitionStandingList(code: String, completion: @escaping (Result<StandingsModel, Error>) -> Void)
    func getCompetitionTeamList(code: String, completion: @escaping (Result<TeamsModel, Error>) -> Void)
}

class FixturesRepository: IFixturesRepository {
    
    fileprivate var remoteDataSource: INetworkService
    
    init(remoteDataSource: INetworkService) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getTodaysFixtureList(completion: @escaping (Result<FootbalFixtureModel, any Error>) -> Void) {
        let baseURL = Constants.ApiHelper.baseURL
        let route = Constants.ApiHelper.todaysFixtures
        
        remoteDataSource.fetch(baseUrl: baseURL, route: route, method: .get, type: FootbalFixtureModel.self, parameters: nil) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
                Logger.printIfDebug(data: "\(success)", logType: .success)
            case .failure(let failure):
                Logger.printIfDebug(data: "Error: \(failure)", logType: .error)
                completion(.failure(failure))
            }
        }
    }
    
    func getCompetitioList(completion: @escaping (Result<CompetitionModel, any Error>) -> Void)  {
        
        let baseURL = Constants.ApiHelper.baseURL
        let route = Constants.ApiHelper.competition
        
        remoteDataSource.fetch(baseUrl: baseURL, route: route, method: .get, type: CompetitionModel.self, parameters: nil) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
                Logger.printIfDebug(data: "\(success)", logType: .success)
            case .failure(let failure):
                Logger.printIfDebug(data: "Error: \(failure)", logType: .error)
                completion(.failure(failure))
            }
        }
    }
    
    func getCompetitionStandingList(code: String, completion: @escaping (Result<StandingsModel, any Error>) -> Void)  {
        
        let baseURL = Constants.ApiHelper.baseURL
        let route = Constants.ApiHelper.standing(code: code)
        
        remoteDataSource.fetch(baseUrl: baseURL, route: route, method: .get, type: StandingsModel.self, parameters: nil) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
                Logger.printIfDebug(data: "\(success)", logType: .success)
            case .failure(let failure):
                Logger.printIfDebug(data: "Error: \(failure)", logType: .error)
                completion(.failure(failure))
            }
        }
    }
    
    func getCompetitionTeamList(code: String, completion: @escaping (Result<TeamsModel, Error>) -> Void) {
        
        let baseURL = Constants.ApiHelper.baseURL
        let route = Constants.ApiHelper.teams(code: code)
        
        remoteDataSource.fetch(baseUrl: baseURL, route: route, method: .get, type: TeamsModel.self, parameters: nil) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
                Logger.printIfDebug(data: "\(success)", logType: .success)
            case .failure(let failure):
                Logger.printIfDebug(data: "Error: \(failure)", logType: .error)
                completion(.failure(failure))
            }
        }
    }
}
