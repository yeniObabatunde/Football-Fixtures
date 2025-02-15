//
//  String+Extension.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
    
    func convertToUserLocalTime(utcTime: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = formatter.date(from: utcTime) {
            formatter.dateFormat = "HH:mm"
            formatter.timeZone = TimeZone.current 
            return formatter.string(from: date)
        }
        
        return nil
    }
}
