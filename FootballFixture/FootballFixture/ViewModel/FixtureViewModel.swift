//
//  FixtureViewModel.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

protocol FixtureViewModelDelegate: AnyObject {
    var players: [Squad] {get set}
    var todaysMatches: [MatchModel] {get set}
    var competitions: [Competition] {get set}
    var standingList: [StandingsTable] {get set}
    var teams: [TeamsTeam] {get set}
    var errorMessage: ((String) -> Void)? {get set}
    var showLoader: ((Bool) -> Void)? { get set }
    
    func getTodaysFixtures()
    func getCompetitioList()
    func getStandingList(code: String)
    func teamsList(code: String)
}

class FixtureViewModel: FixtureViewModelDelegate {
    
    fileprivate let serviceDI: ServiceDIContainerProtocol
    private let realmHelper = RealmHelper()
    var todaysMatches: [MatchModel] = []
    var competitions: [Competition] = []
    var standingList: [StandingsTable] = []
    var teams: [TeamsTeam] = []
    var players: [Squad] = []
    var errorMessage: ((String) -> Void)?
    var showLoader: ((Bool) -> Void)?
    
    init(serviceDI: ServiceDIContainerProtocol) {
        self.serviceDI = serviceDI
    }
    
    func getTodaysFixtures() {
        showLoader?(true)
        
        self.todaysMatches = self.realmHelper.fetch(MatchModel.self)
        if !todaysMatches.isEmpty {
            showLoader?(false)
        }
        serviceDI.footballFixtureRepository.getTodaysFixtureList { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.todaysMatches = data.matches ?? []
                self.realmHelper.save(self.todaysMatches)
                showLoader?(false)
            case .failure(let error):
                errorMessage?(error.localizedDescription)
                showLoader?(false)
            }
        }
    }
    
    func getCompetitioList() {
        showLoader?(true)
        self.competitions = self.realmHelper.fetch(Competition.self)
        if !competitions.isEmpty {
            showLoader?(false)
        }
        serviceDI.footballFixtureRepository.getCompetitioList { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.competitions = data.competitions ?? []
                self.realmHelper.save(competitions)
                showLoader?(false)
            case .failure(let error):
                errorMessage?(error.localizedDescription)
                showLoader?(false)
            }
        }
    }
    
    func getStandingList(code: String) {
        showLoader?(true)
        
        self.standingList = self.realmHelper.fetch(StandingsTable.self)
        if !standingList.isEmpty {
            showLoader?(false)
        }
        serviceDI.footballFixtureRepository.getCompetitionStandingList(code: code) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.standingList = data.standings?.flatMap { $0.table ?? [] } ?? []
                self.realmHelper.save(standingList)
                showLoader?(false)
            case .failure(let error):
                errorMessage?(error.localizedDescription)
                showLoader?(false)
            }
        }
    }
    
    func teamsList(code: String) {
        showLoader?(true)
        
        self.teams = self.realmHelper.fetch(TeamsTeam.self)
        if !teams.isEmpty {
            showLoader?(false)
        }
        serviceDI.footballFixtureRepository.getCompetitionTeamList(code: code) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.teams = data.teams ?? []
                self.realmHelper.save(teams)
                showLoader?(false)
            case .failure(let error):
                errorMessage?(error.localizedDescription)
                showLoader?(false)
            }
        }
    }
    
}
