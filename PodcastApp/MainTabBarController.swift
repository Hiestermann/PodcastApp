//
//  MainTabBarController.swift
//  PodcastApp
//
//  Created by Kilian on 14.02.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        
        tabBar.tintColor = .purple
        
        setupViewControllers()
    }
    
    //MARK:- Setup Functions
    
    fileprivate func setupViewControllers() {
        viewControllers = [
            generateNAvigationController(with: PodcastSearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNAvigationController(with: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            generateNAvigationController(with: ViewController(), title: "Download", image: #imageLiteral(resourceName: "downloads"))
        ]
    }
    
    //MARK:- Helper Functions
    
    fileprivate func generateNAvigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
