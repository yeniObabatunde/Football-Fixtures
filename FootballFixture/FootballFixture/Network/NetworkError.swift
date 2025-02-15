//
//  NetworkError.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

public enum NetworkError: Error, LocalizedError {
    case error(statusCode: Int, data: Data?)
    case invalidData
}

