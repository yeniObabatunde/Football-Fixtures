//
//  Logger.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import Foundation

enum LogType {
    case success
    case error
    case info
}

class Logger {
    
    static func printIfDebug(data: String, logType: LogType) {
#if DEBUG
        switch logType {
        case .success:
            print("🟢🟢🟢", data)
        case .error:
            print("🛑🛑🛑", data)
        case .info:
            print("🟡🟡🟡", data)
        }
#endif
    }
    
}
