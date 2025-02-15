//
//  TeamCollectionViewCell.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    static let identifier = "TeamCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var imageLoadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(logoImageView)
        logoImageView.addSubview(imageLoadingIndicator)
        containerView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            logoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.6),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            imageLoadingIndicator.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor),
            imageLoadingIndicator.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with team: TeamsTeam) {
       
        nameLabel.text = team.name
        if let url = URL(string: team.crest ?? "") {
            loadCachedImage(from: url)
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.logoImageView.image = UIImage(systemName: "soccerball")
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
                    UIView.transition(with: logoImageView,
                                      duration: 0.3,
                                      options: .transitionCrossDissolve) { [weak self] in
                        self?.logoImageView.image = image
                        self?.imageLoadingIndicator.stopAnimating()
                    }
                }
            } catch {
                
                await MainActor.run { [weak self] in
                    self?.logoImageView.image = UIImage(named: "soccerball")
                    self?.imageLoadingIndicator.stopAnimating()
                }
            }
        }
    }
}

