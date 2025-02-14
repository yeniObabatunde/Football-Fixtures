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
}

class FixtureViewModel: FixtureViewModelDelegate {
    
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
    
}
