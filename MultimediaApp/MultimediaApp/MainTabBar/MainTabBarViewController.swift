//
//  MainTabBarViewController.swift
//  MultimediaApp
//
//  Created by Doan Minh Hoang on 2/19/20.
//  Copyright © 2020 Doan Minh Hoang. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBars()
    }
    
    private func setupTabBars() {
        let catchUpVC = Utilities.getViewController(from: "CatchUpStoryboard", viewControllerId: "CatchUpViewController")
        catchUpVC?.tabBarItem = UITabBarItem(title: "CATCH UP", image: UIImage(named: ""), tag: 0)
                
        let myPicksVC = Utilities.getViewController(from: "MyPicksStoryboard", viewControllerId: "MyPicksViewController")
        myPicksVC?.tabBarItem = UITabBarItem(title: "MY PICKS", image: UIImage(named: ""), tag: 1)
        
        let onNowVC = Utilities.getViewController(from: "OnNowStoryboard", viewControllerId: "OnNowViewController")
        onNowVC?.tabBarItem = UITabBarItem(title: "ON NOW", image: UIImage(named: ""), tag: 2)
        
        let searchVC = Utilities.getViewController(from: "SearchStoryboard", viewControllerId: "SearchViewController")
        searchVC?.tabBarItem = UITabBarItem(title: "SEARCH", image: UIImage(named: ""), tag: 3)
        
        let settingsVC = Utilities.getViewController(from: "SettingsStoryboard", viewControllerId: "SettingsViewController")
        settingsVC?.tabBarItem = UITabBarItem(title: "SETTINGS", image: UIImage(named: ""), tag: 4)

        let tabBarList = [catchUpVC, myPicksVC, onNowVC, searchVC, settingsVC] as! [UIViewController]

        viewControllers = tabBarList
    }
}
