//
//  PlayerTableViewCell.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    static let identifier = "PlayerTableViewCell"
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .right
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        [numberLabel, nameLabel, positionLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            numberLabel.widthAnchor.constraint(equalToConstant: 30),
            
            nameLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            positionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: 8),
            positionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            positionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with player: Player) {
        numberLabel.text = "\(player.number)"
        nameLabel.text = player.name
        positionLabel.text = player.position
    }
}
