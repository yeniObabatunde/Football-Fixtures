//
//  CompetitionTableViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class CompetitionTableViewController: BaseViewController {
    
    private let competitionItem: Competition
    
    lazy var layout = CompetitionTableLayout()
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
        setupUI()
        viewModel.getStandingList(code: competitionItem.code ?? "")
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
        viewModel.getStandingList(code: competitionItem.code ?? "")
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

extension CompetitionTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.standingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StandingsTableViewCell.identifier, for: indexPath) as? StandingsTableViewCell else {
            return UITableViewCell()
        }
        let standing = viewModel.standingList[indexPath.row]
        cell.configure(with: standing)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
