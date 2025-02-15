//
//  ServiceDIContainerMock.swift
//  FootballFixtureTests
//
//  Created by Sharon Omoyeni Babatunde on 15/02/2025.
//

import XCTest
@testable import FootballFixture

final class ServiceDIContainerMock: ServiceDIContainerProtocol {
    
   let footballFixtureRepository: IFixturesRepository
  
    init(footballFixtureService: IFixturesRepository) {
        self.footballFixtureRepository = footballFixtureService
    }

}
