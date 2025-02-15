//
//  FootbalFixtureModel.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

struct FootbalFixtureModel: Codable {
    let filters: Filters?
    let resultSet: ResultSet?
    let matches: [MatchModel]?
}

struct Filters: Codable {
    let dateFrom, dateTo, permission: String?
}

struct MatchModel: Codable, Equatable {
    let area: Area?
    let competition: Competition?
    let id: Int?
    let utcDate: String?
    let status: String?
    let matchday: Int?
    let stage: String?
    let lastUpdated: String?
    let homeTeam, awayTeam: Team?
    let score: Score?
}

struct Area: Codable, Equatable {
    let id: Int?
    let name, code: String?
    let flag: String?
}

struct Team: Codable, Equatable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
}

struct Competition: Codable, Equatable {
    let id: Int?
    let name, code, type: String?
    let emblem: String?
}

struct Odds: Codable {
    let msg: String?
}

struct Score: Codable, Equatable {
    let winner: String?
    let duration: String?
    let fullTime, halfTime, regularTime, penalties: FullTime?
}

struct FullTime: Codable, Equatable {
    let home, away: Int?
}

struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
//    let winner: JSONNull?
}

struct ResultSet: Codable {
    let count: Int?
    let competitions, first, last: String?
    let played: Int?
}
