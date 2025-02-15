//
//  MatchStatusUpdater.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 15/02/2025.
//

import Foundation

class MatchStatusUpdater {
    private var timer: Timer?
    
    func getMatchStatus(utcDate: String, status: String, duration: String, updateHandler: @escaping (String) -> Void) {
        guard status.lowercased() == "in_play" else {
            timer?.invalidate()
            updateHandler("")
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let matchStart = formatter.date(from: utcDate) else {
            updateHandler("Invalid Date")
            return
        }
        
        func updateTime() {
            let now = Date()
            let elapsedSeconds = Int(now.timeIntervalSince(matchStart))
            
            if elapsedSeconds < 0 {
                formatter.timeZone = TimeZone.current
                formatter.dateFormat = "HH:mm"
                updateHandler(formatter.string(from: matchStart))
                return
            }
            
            let elapsedMinutes = elapsedSeconds / 60
            var timeString = ""
            
            if duration == "REGULAR" {
                switch elapsedMinutes {
                case 0..<45:
                    timeString = "\(elapsedMinutes)'"
                case 45..<50:
                    timeString = "HT"
                case 50..<90:
                    timeString = "\(elapsedMinutes - 5)'"
                default:
                    timeString = "90+'"
                }
            } else {
                let extraTime = elapsedMinutes - 90
                timeString = "ET \(extraTime)+'"
            }
            updateHandler(timeString)
        }
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
            updateTime()
        }
        updateTime()
    }
}
