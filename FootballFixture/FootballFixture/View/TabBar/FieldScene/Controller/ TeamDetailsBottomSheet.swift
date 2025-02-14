//
//   TeamDetailsBottomSheet.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class TeamDetailsBottomSheet: UIViewController {

    private let team: Team
    private var players: [Player] = []
    private lazy var detailsView = TeamDetailsLayout()
    private var viewModel: FixtureViewModelDelegate = FixtureViewModel()
    
    init(team: Team) {
        self.team = team
        self.players = viewModel.players
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        detailsView.delegate = self
        detailsView.tableView.delegate = self
        detailsView.tableView.dataSource = self
        detailsView.configure(with: team)
    }
}

extension TeamDetailsBottomSheet: TeamDetailsViewDelegate {
    func didTapClose() {
        dismiss(animated: true)
    }
}

extension TeamDetailsBottomSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        
        let player = players[indexPath.row]
        cell.configure(with: player)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
