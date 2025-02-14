//
//  CompetitionTableViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class CompetitionTableViewController: UIViewController {
    
    lazy var layout = CompetitionTableLayout()
    private var viewModel: FixtureViewModelDelegate = FixtureViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func loadView() {
        view = layout
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        layout.tableView.delegate = self
        layout.tableView.dataSource = self
    }
}

extension CompetitionTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.standings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StandingsTableViewCell.identifier, for: indexPath) as? StandingsTableViewCell else {
            return UITableViewCell()
        }
        let standing = viewModel.standings[indexPath.row]
        cell.configure(with: standing)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
