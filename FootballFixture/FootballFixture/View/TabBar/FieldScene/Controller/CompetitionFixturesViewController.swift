//
//  CompetitionFixturesViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit


class CompetitionFixturesViewController: UIViewController {
    
    private lazy var noFixturesView: NoFixturesView = {
        let view = NoFixturesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(noFixturesView)
        
        NSLayoutConstraint.activate([
            noFixturesView.topAnchor.constraint(equalTo: view.topAnchor),
            noFixturesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noFixturesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noFixturesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CompetitionFixturesViewController: NoFixturesViewDelegate {
    func didTapRetry() {
        print("Retry tapped - implement fixture reload")
    }
}
