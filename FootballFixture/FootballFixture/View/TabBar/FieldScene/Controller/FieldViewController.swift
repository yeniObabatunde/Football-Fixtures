//
//  CompetitonViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class CompetitonViewController: UIViewController {
    
    private let layout = FieldLayout()
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

extension CompetitonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.competitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompetitionCell", for: indexPath)
       
        let competition = viewModel.competitions[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = competition
        config.textProperties.font = .boldSystemFont(ofSize: 16)
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
        let selectedCompetition = viewModel.competitions[indexPath.row]
        print("Selected competition: \(selectedCompetition)")
        
        self.navigationController?.pushViewController(CompetitionDetailViewController(competitionName: selectedCompetition), animated: true)
    }
    
}
