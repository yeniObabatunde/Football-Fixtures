//
//  Constants.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

enum Constants {
    
    enum ApiHelper {
        static let baseURL = "https://api.football-data.org/v4/"
        static let authorizationKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        static let todaysFixtures = "matches"
        static let competition = "competitions"
        static func standing(code: String) -> String {
            return "competitions/\(code)/standings"
        }
        static func teams(code: String) -> String {
            return "competitions/\(code)/teams"
        }
    }
}
