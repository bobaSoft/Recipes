//
//  MainTabBarController.swift
//  Recipes
//
//  Created by Михаил Бобров on 13.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = ViewController()
        viewControllers = [
            setUpNavigationController(title: "Тест", image: UIImage(systemName: "questionmark"), rootViewController: vc)
        ]
    }
    
    private func setUpNavigationController(title: String, image: UIImage?, rootViewController: UIViewController) -> UIViewController {
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.tabBarItem.image = image
        navigationViewController.tabBarItem.title = title
        return navigationViewController
    }
}
