//
//  CompetitionDetailViewController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

final class CompetitionDetailViewController: BaseViewController {
    
    private let competitionItem: Competition
    private lazy var detailView = CompetitionDetailLayout()
    
    private lazy var tableViewController = CompetitionTableViewController(competitionName: competitionItem)
    private lazy var fixturesViewController = CompetitionFixturesViewController()
    private lazy var teamsViewController = CompetitionTeamsViewController(competitionName: competitionItem)
    
    private var currentViewController: UIViewController?
    
    init(competitionName: Competition) {
        self.competitionItem = competitionName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupViewController() {
        detailView.delegate = self
        detailView.configure(with: competitionItem.name ?? "")
        showViewController(tableViewController)
    }
    
    private func showViewController(_ viewController: UIViewController) {
        
        currentViewController?.willMove(toParent: nil)
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
        
        addChild(viewController)
        detailView.setContent(viewController.view)
        viewController.didMove(toParent: self)
        
        currentViewController = viewController
    }
}

extension CompetitionDetailViewController: CompetitionDetailViewDelegate {
    func didSelectSegment(_ index: Int) {
        switch index {
        case 0:
            showViewController(tableViewController)
        case 1:
            showViewController(fixturesViewController)
        case 2:
            showViewController(teamsViewController)
        default:
            break
        }
    }
    
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
