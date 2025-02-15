//
//  StandingsModel.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

struct StandingsModel: Codable {
    let filters: StandingsFilters?
    let area: StandingsArea?
    let competition: StandingsCompetition?
    let season: StandingsSeason?
    let standings: [Standing]?
}

struct StandingsArea: Codable {
    let id: Int?
    let name, code: String?
    let flag: String?
}

struct StandingsCompetition: Codable {
    let id: Int?
    let name, code, type: String?
    let emblem: String?
}

struct StandingsFilters: Codable {
    let season: String?
}

struct StandingsSeason: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
//    let winner: JSONNull?
}

struct Standing: Codable {
    let stage, type, group: String?
    let table: [StandingsTable]?
}

struct StandingsTable: Codable {
    let position: Int?
    let team: StandingsTeam?
    let playedGames: Int?
//    let form: JSONNull?
    let won, draw, lost, points: Int?
    let goalsFor, goalsAgainst, goalDifference: Int?
}

struct StandingsTeam: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
}
