//
//  CompetitionTeamsViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

struct Team {
    let name: String
    let logoName: String
}

struct Player {
    let number: Int
    let name: String
    let position: String
}

class CompetitionTeamsViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private let teams: [Team] = [
        Team(name: "AFC Bournemouth", logoName: "bournemouth"),
        Team(name: "Arsenal FC", logoName: "arsenal"),
        Team(name: "Brighton & Hove Albion", logoName: "brighton"),
        Team(name: "Burnley FC", logoName: "burnley"),
        Team(name: "Chelsea FC", logoName: "chelsea"),
        Team(name: "Crystal Palace FC", logoName: "palace"),
        Team(name: "Everton FC", logoName: "everton"),
        Team(name: "Huddersfield Town", logoName: "huddersfield"),
        Team(name: "Leicester City FC", logoName: "leicester")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TeamCollectionViewCell.self, forCellWithReuseIdentifier: TeamCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CompetitionTeamsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.identifier, for: indexPath) as? TeamCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: teams[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width / 3
        return CGSize(width: width, height: width * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let team = teams[indexPath.row]
        showTeamDetails(for: team)
    }
    
    func showTeamDetails(for team: Team) {
        let detailsVC = TeamDetailsBottomSheet(team: team)
        
        if let sheet = detailsVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        present(detailsVC, animated: true)
    }
}
