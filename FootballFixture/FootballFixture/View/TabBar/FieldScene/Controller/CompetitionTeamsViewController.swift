//
//  CompetitionTeamsViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class CompetitionTeamsViewController: BaseViewController {
    
   private let layout = CompetitionTeamsLayout()
    
    private let competitionItem: Competition
    private var viewModel: FixtureViewModelDelegate = FixtureViewModel(serviceDI: ServiceDIContainer.shared)
    
    init(competitionName: Competition) {
        self.competitionItem = competitionName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.teamsList(code: competitionItem.code ?? "")
    }
    
    override func loadView() {
        view = layout
    }
    
    private func setupCollectionView() {
        layout.collectionView.delegate = self
        layout.collectionView.dataSource = self
        layout.collectionView.refreshControl = refreshControl
    }
    
    override func refreshData() {
        viewModel.teamsList(code: competitionItem.code ?? "")
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
               self.refreshControl.endRefreshing()
           }
       }
    
    override func bindViewModel() {
        viewModel.showLoader = { [weak self] isLoading in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showLoader(isLoading)
                if !isLoading {
                    self.layout.collectionView.reloadData()
                }
            }
        }
        viewModel.errorMessage = { [weak self] errorMessage in
            guard let self = self else { return }
            showError(message: errorMessage)
        }
    }
}

extension CompetitionTeamsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.identifier, for: indexPath) as? TeamCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: viewModel.teams[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width / 3
        return CGSize(width: width, height: width * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let team = viewModel.teams[indexPath.row]
        showTeamDetails(for: team, players: team.squad ?? [])
    }
    
    func showTeamDetails(for team: TeamsTeam, players: [Squad]) {
        let detailsVC = TeamDetailsBottomSheet(team: team, players: players)
        
        if let sheet = detailsVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        present(detailsVC, animated: true)
    }
}


class CompetitionTeamsLayout: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TeamCollectionViewCell.self, forCellWithReuseIdentifier: TeamCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
      addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
