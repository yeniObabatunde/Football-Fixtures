//
//  MockFixturesRepository.swift
//  FootballFixtureTests
//
//  Created by Sharon Omoyeni Babatunde on 15/02/2025.
//

import XCTest
@testable import FootballFixture

enum MockError: Error {
    case invalidResultType
}

class MockFixturesRepository: IFixturesRepository {
    
    var fixtureResult: Result<FootbalFixtureModel, Error>?
    var competitionResult: Result<CompetitionModel, Error>?
    var standingsResult: Result<StandingsModel, Error>?
    var teamsResult: Result<TeamsModel, Error>?
    
    func getTodaysFixtureList(completion: @escaping (Result<FootbalFixtureModel, Error>) -> Void) {
        guard let result = fixtureResult else {
            completion(.failure(NSError(domain: "Mock Error", code: 0, userInfo: nil)))
            return
        }
        completion(result)
    }
    
    func getCompetitioList(completion: @escaping (Result<CompetitionModel, Error>) -> Void) {
        guard let result = competitionResult else {
            completion(.failure(NSError(domain: "Mock Error", code: 0, userInfo: nil)))
            return
        }
        completion(result)
    }
    
    func getCompetitionStandingList(code: String, completion: @escaping (Result<StandingsModel, Error>) -> Void) {
        guard let result = standingsResult else {
            completion(.failure(NSError(domain: "Mock Error", code: 0, userInfo: nil)))
            return
        }
        completion(result)
    }
    
    func getCompetitionTeamList(code: String, completion: @escaping (Result<TeamsModel, Error>) -> Void) {
        guard let result = teamsResult else {
            completion(.failure(NSError(domain: "Mock Error", code: 0, userInfo: nil)))
            return
        }
        completion(result)
    }
}
