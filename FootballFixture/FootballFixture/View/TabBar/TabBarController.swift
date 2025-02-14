//
//  TabBarController.swift
//  FootballFixture
//
//  Created by Sharon Omoyeni Babatunde on 14/02/2025.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBarAppearance()
    }
    
    private func setupViewControllers() {
        let fixturesVC = FixturesViewController()
        fixturesVC.title = "Today's Fixtures"
        let fixturesNav = UINavigationController(rootViewController: fixturesVC)
        fixturesNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "soccerball"),
            selectedImage: UIImage(systemName: "soccerball.fill")
        )
        
        let fieldVC = CompetitonViewController()
        fieldVC.title = "Competitions"
        let fieldNav = UINavigationController(rootViewController: fieldVC)
        fieldNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "sportscourt"),
            selectedImage: UIImage(systemName: "sportscourt.fill")
        )
        viewControllers = [fixturesNav, fieldNav]
    }
    
    private func setupTabBarAppearance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
    }
}
