//
//  FootballFixturesViewModelTests.swift
//  FootballFixtureTests
//
//  Created by Sharon Omoyeni Babatunde on 15/02/2025.
//

import XCTest
@testable import FootballFixture

final class FootballFixturesViewModelTests: XCTestCase {
    
    var viewModel: FixtureViewModel!
    var mockRepository: MockFixturesRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockFixturesRepository()
        let mockDIContainer = ServiceDIContainerMock(footballFixtureService: mockRepository)
        viewModel = FixtureViewModel(serviceDI: mockDIContainer)
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testGetTodaysFixturesSuccess() {
        let expectedMatches = [MatchModel(area: nil, competition: nil, id: 2, utcDate: "", status: "", matchday: 0, stage: "", lastUpdated: "", homeTeam: Team(id: 3, name: "Team A", shortName: "Team B", tla: "", crest: ""), awayTeam:  Team(id: 1, name: "Team B", shortName: "Team B", tla: "", crest: ""), score: nil)]
        
        mockRepository.fixtureResult = .success(FootbalFixtureModel(filters: nil, resultSet: nil, matches: expectedMatches))
        let expectation = XCTestExpectation(description: "Fetch today's fixtures")
        
        viewModel.showLoader = { isLoading in
            if !isLoading {
                expectation.fulfill()
            }
        }
        
        viewModel.getTodaysFixtures()
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertEqual(viewModel.todaysMatches, expectedMatches)
    }
    
    func testGetTodaysFixturesFailure() {
        mockRepository.fixtureResult = .failure(NSError(domain: "TestError", code: -1, userInfo: nil))
        
        let expectation = self.expectation(description: "Handle error for today's fixtures")
        
        viewModel.errorMessage = { errorMessage in
            XCTAssertNotNil(errorMessage)
            expectation.fulfill()
        }
        
        viewModel.getTodaysFixtures()
        waitForExpectations(timeout: 1.0)
    }
    
    
    func testGetCompetitionListSuccess() {
        let expectedCompetitions = [Competition(id: 1, name: "Premier League", code: "PL", type: "", emblem: nil)]
        mockRepository.competitionResult = .success(CompetitionModel(count: 0, filters: nil, competitions: expectedCompetitions))
        
        let expectation = self.expectation(description: "Fetch competition list")
        
        viewModel.showLoader = { isLoading in
            if !isLoading {
                expectation.fulfill()
            }
        }
        viewModel.getCompetitioList()
        waitForExpectations(timeout: 1.0)
        
        XCTAssertEqual(viewModel.competitions, expectedCompetitions)
    }
    
    func testGetCompetitionListFailure() {
        mockRepository.competitionResult = .failure(NSError(domain: "TestError", code: -1, userInfo: nil))
        
        let expectation = self.expectation(description: "Handle error for competition list")
        
        viewModel.errorMessage = { errorMessage in
            XCTAssertNotNil(errorMessage)
            expectation.fulfill()
        }
        
        viewModel.getCompetitioList()
        waitForExpectations(timeout: 1.0)
    }
    
}
