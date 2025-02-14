//
//  FixtureViewModel.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

protocol FixtureViewModelDelegate: AnyObject {
    var fixtures: [Fixture] {get set}
    var competitions: [String] {get set}
    var standings: [TeamStanding] {get set}
    var players: [Player] {get set}
}

class FixtureViewModel: FixtureViewModelDelegate {
    
    var players: [Player] = [
        Player(number: 1, name: "David de Gea", position: "Keeper"),
        Player(number: 2, name: "Victor Lindelöf", position: "Centre-Back"),
        Player(number: 3, name: "Eric Bailly", position: "Centre-Back"),
        Player(number: 4, name: "Phil Jones", position: "Centre-Back"),
        Player(number: 5, name: "Marcos Rojo", position: "Centre-Back"),
        Player(number: 6, name: "Paul Pogba", position: "Central Midfield"),
        Player(number: 7, name: "Alexis Sánchez", position: "Left Wing"),
        Player(number: 8, name: "Juan Mata", position: "Attacking Midfield"),
        Player(number: 9, name: "Romelu Lukaku", position: "Centre-Forward")
    ]
    
    
     var fixtures: [Fixture] = [
           Fixture(
               time: "10:30",
               matchId: "MD: 39",
               homeTeam: "AS Avellino 1912",
               awayTeam: "AS Cittadella",
               homeScore: 0,
               awayScore: 0,
               homeTime: "90'",
               awayTime: "90'"
           ),
           Fixture(
               time: "13:00",
               matchId: "MD: 39",
               homeTeam: "Pro Vercelli",
               awayTeam: "Venezia",
               homeScore: 0,
               awayScore: 0,
               homeTime: "00'",
               awayTime: "00'"
           ),
           Fixture(
               time: "13:00",
               matchId: "MD: 39",
               homeTeam: "Brescia Calcio",
               awayTeam: "Frosinone Calcio",
               homeScore: 0,
               awayScore: 0,
               homeTime: "00'",
               awayTime: "00'"
           ),
           Fixture(
               time: "13:00",
               matchId: "MD: 39",
               homeTeam: "Carpi FC",
               awayTeam: "Empoli FC",
               homeScore: 0,
               awayScore: 0,
               homeTime: "00'",
               awayTime: "00'"
           ),
           Fixture(
               time: "13:00",
               matchId: "MD: 39",
               homeTeam: "Cremonese",
               awayTeam: "Novara Calcio",
               homeScore: 0,
               awayScore: 0,
               homeTime: "00'",
               awayTime: "00'"
           ),
           Fixture(
               time: "13:00",
               matchId: "MD: 39",
               homeTeam: "Foggia",
               awayTeam: "",
               homeScore: 0,
               awayScore: 0,
               homeTime: "00'",
               awayTime: ""
           )
       ]
    
var competitions: [String] = [
        "1. Bundesliga 2017/18",
        "2. Bundesliga 2017/18",
        "Australian A-League",
        "Campeonato Brasileiro da Série A",
        "Champions League 2017/18",
        "Championship 2017/18",
        "DFB-Pokal 2017/18",
        "Eredivisie 2017/18",
        "League One 2017/18",
        "League Two 2017/18",
        "Ligue 1 2017/18"
    ]
    
   var standings: [TeamStanding] = [
            TeamStanding(position: 1, teamName: "ManCity", matchesPlayed: 35, goalDifference: 76, points: 93),
            TeamStanding(position: 2, teamName: "ManU", matchesPlayed: 35, goalDifference: 40, points: 77),
            TeamStanding(position: 3, teamName: "Liverpool", matchesPlayed: 36, goalDifference: 43, points: 72),
            TeamStanding(position: 4, teamName: "Spurs", matchesPlayed: 35, goalDifference: 37, points: 71),
            TeamStanding(position: 5, teamName: "Chelsea", matchesPlayed: 35, goalDifference: 26, points: 66),
            TeamStanding(position: 6, teamName: "Arsenal", matchesPlayed: 35, goalDifference: 19, points: 57),
            TeamStanding(position: 7, teamName: "Burnley", matchesPlayed: 36, goalDifference: 3, points: 54),
            TeamStanding(position: 8, teamName: "Everton", matchesPlayed: 36, goalDifference: -12, points: 48),
            TeamStanding(position: 9, teamName: "Foxes", matchesPlayed: 35, goalDifference: -3, points: 44),
            TeamStanding(position: 10, teamName: "Newcastle", matchesPlayed: 35, goalDifference: -9, points: 41),
            TeamStanding(position: 11, teamName: "Crystal", matchesPlayed: 36, goalDifference: -13, points: 38),
            TeamStanding(position: 12, teamName: "Bournemouth", matchesPlayed: 36, goalDifference: -18, points: 38),
            TeamStanding(position: 13, teamName: "Watford", matchesPlayed: 36, goalDifference: -20, points: 38),
            TeamStanding(position: 14, teamName: "Brighton", matchesPlayed: 35, goalDifference: -15, points: 37),
            TeamStanding(position: 15, teamName: "West Ham", matchesPlayed: 35, goalDifference: -24, points: 35),
            TeamStanding(position: 16, teamName: "Huddersfield", matchesPlayed: 35, goalDifference: -29, points: 35),
            TeamStanding(position: 17, teamName: "Swans", matchesPlayed: 35, goalDifference: -25, points: 33)
        ]
    
}
