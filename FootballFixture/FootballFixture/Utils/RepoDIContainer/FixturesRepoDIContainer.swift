//
//  FixturesRepoDIContainer.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

protocol ServiceDIContainerProtocol {
    var footballFixtureRepository: IFixturesRepository { get }
}


final class ServiceDIContainer: ServiceDIContainerProtocol {
    
    static let shared = ServiceDIContainer()
    
    lazy var footballFixtureRepository: IFixturesRepository = {
        
        let networkService = RemoteNetworkService()
        let fixturesRepository = FixturesRepository(remoteDataSource: networkService)
        return fixturesRepository
    }()
    
    private init() {}
}
