//
//  TeamDetailsLayout.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

protocol TeamDetailsViewDelegate: AnyObject {
    func didTapClose()
}

class TeamDetailsLayout: UIView {
   
    weak var delegate: TeamDetailsViewDelegate?
 
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.identifier)
        table.separatorInset = .zero
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        addSubview(headerView)
        headerView.addSubview(closeButton)
        headerView.addSubview(teamNameLabel)
        headerView.addSubview(teamLogoImageView)
        addSubview(tableView)
        
        setupConstraints()
        setupActions()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            closeButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            
            teamNameLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            teamNameLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            
            teamLogoImageView.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 16),
            teamLogoImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            teamLogoImageView.widthAnchor.constraint(equalToConstant: 60),
            teamLogoImageView.heightAnchor.constraint(equalToConstant: 60),
            teamLogoImageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupActions() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        delegate?.didTapClose()
    }
    
    func configure(with team: Team) {
        teamNameLabel.text = team.name
        teamLogoImageView.image = UIImage(named: team.logoName) ?? UIImage(systemName: "soccerball")
    }
}
