//
//  ViewController.swift
//  Recipes
//
//  Created by Михаил Бобров on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }

    override func viewWillLayoutSubviews() {
        
    }

    
    override func loadView() {
        self.view = customView
    }
}

