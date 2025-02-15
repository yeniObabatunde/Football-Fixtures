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
    
    lazy var imageLoadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
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
        teamLogoImageView.addSubview(imageLoadingIndicator)
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
            
            imageLoadingIndicator.centerXAnchor.constraint(equalTo: teamLogoImageView.centerXAnchor),
            imageLoadingIndicator.centerYAnchor.constraint(equalTo: teamLogoImageView.centerYAnchor),
            
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
    
    func configure(with team: TeamsTeam) {
        teamNameLabel.text = team.name
        if let url = URL(string: team.crest ?? "") {
            loadCachedImage(from: url)
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.teamLogoImageView.image = UIImage(systemName: "soccerball")
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
                    UIView.transition(with: teamLogoImageView,
                                      duration: 0.3,
                                      options: .transitionCrossDissolve) { [weak self] in
                        self?.teamLogoImageView.image = image
                        self?.imageLoadingIndicator.stopAnimating()
                    }
                }
            } catch {
                
                await MainActor.run { [weak self] in
                    self?.teamLogoImageView.image = UIImage(named: "soccerball")
                    self?.imageLoadingIndicator.stopAnimating()
                }
            }
        }
    }
}
