//
//  TeamsModel.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

struct TeamsModel: Codable {
    let count: Int?
    let filters: TeamsFilters?
    let competition: TeamsCompetition?
    let season: TeamsSeason?
    let teams: [TeamsTeam]?
}

struct TeamsCompetition: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let type: TypeEnum?
    let emblem: String?
}

struct TeamsFilters: Codable {
    let season: String?
}

struct TeamsSeason: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
//    let winner: JSONNull?
}

struct TeamsTeam: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
    let address: String?
    let website: String?
    let founded: Int?
    let clubColors, venue: String?
    let squad: [Squad]?
    let lastUpdated: String?
}

struct TeamsArea: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?
}

struct Squad: Codable {
    let id: Int?
    let name: String?
    let position: String?
    let dateOfBirth: String?
    let nationality: String?
}
