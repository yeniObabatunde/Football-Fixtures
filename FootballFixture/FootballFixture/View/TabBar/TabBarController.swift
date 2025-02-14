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
        fixturesVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "soccerball"),
            selectedImage: UIImage(systemName: "soccerball.fill")
        )
        
        let fieldVC = FieldViewController()
        fieldVC.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "sportscourt"),
            selectedImage: UIImage(systemName: "sportscourt.fill")
        )
        
        viewControllers = [fixturesVC, fieldVC]
    }
    
    private func setupTabBarAppearance() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
    }
}
