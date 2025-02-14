//
//  StandingsTableViewCell.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

struct TeamStanding {
    let position: Int
    let teamName: String
    let matchesPlayed: Int
    let goalDifference: Int
    let points: Int
}

class StandingsTableViewCell: UITableViewCell {
    
    static let identifier = "StandingsTableViewCell"
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private let teamIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "soccerball")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let matchesPlayedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let goalDifferenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let pointsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
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
        [positionLabel, teamIcon, teamNameLabel, matchesPlayedLabel,
         goalDifferenceLabel, pointsLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            positionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            positionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            positionLabel.widthAnchor.constraint(equalToConstant: 25),

            teamIcon.leadingAnchor.constraint(equalTo: positionLabel.trailingAnchor, constant: 8),
            teamIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamIcon.widthAnchor.constraint(equalToConstant: 20),
            teamIcon.heightAnchor.constraint(equalToConstant: 20),

            teamNameLabel.leadingAnchor.constraint(equalTo: teamIcon.trailingAnchor, constant: 8),
            teamNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            pointsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            pointsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pointsLabel.widthAnchor.constraint(equalToConstant: 35),
            
            goalDifferenceLabel.trailingAnchor.constraint(equalTo: pointsLabel.leadingAnchor, constant: -16),
            goalDifferenceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            goalDifferenceLabel.widthAnchor.constraint(equalToConstant: 35),

            matchesPlayedLabel.trailingAnchor.constraint(equalTo: goalDifferenceLabel.leadingAnchor, constant: -16),
            matchesPlayedLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            matchesPlayedLabel.widthAnchor.constraint(equalToConstant: 35),

            teamNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: matchesPlayedLabel.leadingAnchor, constant: -8)
        ])
    }
    
    func configure(with standing: TeamStanding) {
        positionLabel.text = "\(standing.position)"
        teamNameLabel.text = standing.teamName
        matchesPlayedLabel.text = "\(standing.matchesPlayed)"
        goalDifferenceLabel.text = "\(standing.goalDifference)"
        pointsLabel.text = "\(standing.points)"
    }
}
