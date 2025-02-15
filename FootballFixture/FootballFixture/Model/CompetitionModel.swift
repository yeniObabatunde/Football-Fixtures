//
//  CompetitionModel.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

struct CompetitionModel: Codable {
    let count: Int?
    let filters: CompetitionFilters?
    let competitions: [Competition]?
}

struct CompetitionItem: Codable {
    let id: Int?
    let area: CompetitionArea?
    let name, code: String?
    let type: TypeEnum?
    let emblem: String?
    let plan: Plan?
    let currentSeason: CurrentSeason?
    let numberOfAvailableSeasons: Int?
    let lastUpdated: Date?
}

struct CompetitionArea: Codable {
    let id: Int?
    let name, code: String?
    let flag: String?
}

struct CurrentSeason: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let winner: Winner?
}

struct Winner: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
    let address: String?
    let website: String?
    let founded: Int?
    let clubColors: String?
    let venue: String?
    let lastUpdated: Date?
}

enum Plan: String, Codable {
    case tierFour = "TIER_FOUR"
    case tierOne = "TIER_ONE"
}

enum TypeEnum: String, Codable {
    case cup = "CUP"
    case league = "LEAGUE"
}

struct CompetitionFilters: Codable {
    let client: String?
}
