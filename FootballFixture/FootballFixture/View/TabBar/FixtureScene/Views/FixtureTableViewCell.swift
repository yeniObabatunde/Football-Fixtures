//
//  FixtureTableViewCell.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class FixtureTableViewCell: UITableViewCell {
    
    static let identifier: String = "FixtureTableViewCell"
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TIMED"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let matchIdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let homeTeamLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let awayTeamLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let homeScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .right
        return label
    }()
    
    private let awayScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .right
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [statusLabel, timeLabel, matchIdLabel, homeTeamLabel, awayTeamLabel,
         homeScoreLabel, awayScoreLabel, durationLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            statusLabel.widthAnchor.constraint(equalToConstant: 50),
            
            timeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            
            matchIdLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4),
            matchIdLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            
            homeTeamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            homeTeamLabel.leadingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 24),
            homeTeamLabel.trailingAnchor.constraint(equalTo: homeScoreLabel.leadingAnchor, constant: -16),
            
            awayTeamLabel.topAnchor.constraint(equalTo: homeTeamLabel.bottomAnchor, constant: 8),
            awayTeamLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.leadingAnchor),
            awayTeamLabel.trailingAnchor.constraint(equalTo: homeTeamLabel.trailingAnchor),
            
            homeScoreLabel.centerYAnchor.constraint(equalTo: homeTeamLabel.centerYAnchor),
            homeScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            homeScoreLabel.widthAnchor.constraint(equalToConstant: 30),
            
            awayScoreLabel.centerYAnchor.constraint(equalTo: awayTeamLabel.centerYAnchor),
            awayScoreLabel.trailingAnchor.constraint(equalTo: homeScoreLabel.trailingAnchor),
            awayScoreLabel.widthAnchor.constraint(equalToConstant: 30),
            
            durationLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: homeScoreLabel.leadingAnchor, constant: -4),
            durationLabel.widthAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    func configure(with fixture: Fixture) {
        timeLabel.text = fixture.time
        matchIdLabel.text = fixture.matchId
        homeTeamLabel.text = fixture.homeTeam
        awayTeamLabel.text = fixture.awayTeam
        homeScoreLabel.text = String(fixture.homeScore)
        awayScoreLabel.text = String(fixture.awayScore)
        durationLabel.text = fixture.homeTime
    }
}

    
