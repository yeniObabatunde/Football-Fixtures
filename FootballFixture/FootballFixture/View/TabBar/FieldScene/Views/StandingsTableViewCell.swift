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
    
    lazy var imageLoadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
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
        teamIcon.addSubview(imageLoadingIndicator)
        
        NSLayoutConstraint.activate([
            positionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            positionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            positionLabel.widthAnchor.constraint(equalToConstant: 25),
            
            teamIcon.leadingAnchor.constraint(equalTo: positionLabel.trailingAnchor, constant: 8),
            teamIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamIcon.widthAnchor.constraint(equalToConstant: 20),
            teamIcon.heightAnchor.constraint(equalToConstant: 20),
            
            imageLoadingIndicator.centerXAnchor.constraint(equalTo: teamIcon.centerXAnchor),
            imageLoadingIndicator.centerYAnchor.constraint(equalTo: teamIcon.centerYAnchor),
            
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
    
    func configure(with standing: StandingsTable) {
        positionLabel.text = "\(standing.position ?? 0)"
        teamNameLabel.text = standing.team?.shortName
        matchesPlayedLabel.text = "\(standing.playedGames ?? 0)"
        goalDifferenceLabel.text = "\(standing.goalDifference ?? 0)"
        pointsLabel.text = "\(standing.points ?? 0)"
        if let url = URL(string: standing.team?.crest ?? "") {
            loadCachedImage(from: url)
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.teamIcon.image = UIImage(systemName: "soccerball")
            }
        }
    }
    
    private func loadCachedImage(from url: URL?) {
        guard let url = url else { return }
        imageLoadingIndicator.startAnimating()
        Task {
            do {
                let image = try await ImageLoadingService.shared.loadImage(from: url)
                await MainActor.run {
                    UIView.transition(with: teamIcon,
                                      duration: 0.3,
                                      options: .transitionCrossDissolve) { [weak self] in
                        self?.teamIcon.image = image
                        self?.imageLoadingIndicator.stopAnimating()
                    }
                }
            } catch {
                
                await MainActor.run { [weak self] in
                    self?.teamIcon.image = UIImage(named: "soccerball")
                    self?.imageLoadingIndicator.stopAnimating()
                }
            }
        }
    }
}
