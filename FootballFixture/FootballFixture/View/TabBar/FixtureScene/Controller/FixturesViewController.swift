//
//  FixturesViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class FixturesViewController: UIViewController {
    
    private let layout = FixturesLayout()
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
        title = "Today's Fixtures"

        layout.tableView.delegate = self
        layout.tableView.dataSource = self
    }
}

extension FixturesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fixtures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FixtureTableViewCell.identifier, for: indexPath) as? FixtureTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: viewModel.fixtures[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
