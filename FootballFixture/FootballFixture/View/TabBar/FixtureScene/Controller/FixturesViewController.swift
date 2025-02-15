//
//  FixturesViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class FixturesViewController: BaseViewController {
    
    private let layout = FixturesLayout()
    private var viewModel: FixtureViewModelDelegate = FixtureViewModel(serviceDI: ServiceDIContainer.shared)
    let matchStatusUpdater = MatchStatusUpdater()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.getTodaysFixtures()
    }
    
    override func loadView() {
        view = layout
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        layout.tableView.delegate = self
        layout.tableView.dataSource = self
        layout.tableView.refreshControl = refreshControl
    }
    
    override func refreshData() {
        viewModel.getTodaysFixtures()
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
                    self.layout.tableView.reloadData()
                }
            }
        }
        
        viewModel.errorMessage = { [weak self] errorMessage in
            guard let self = self else { return }
            showError(message: errorMessage)
        }
    }
}

extension FixturesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todaysMatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FixtureTableViewCell.identifier, for: indexPath) as? FixtureTableViewCell else {
            return UITableViewCell()
        }
        let item = viewModel.todaysMatches[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
