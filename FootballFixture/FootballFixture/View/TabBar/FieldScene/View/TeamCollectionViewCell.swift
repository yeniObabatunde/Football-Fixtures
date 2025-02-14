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
            
            nameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with team: Team) {
        logoImageView.image = UIImage(named: team.logoName) ?? UIImage(systemName: "soccerball")
        nameLabel.text = team.name
    }
}

