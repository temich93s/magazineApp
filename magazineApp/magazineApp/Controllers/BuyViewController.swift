//
//  BuyViewController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// Страница с общим списком товара
final class BuyViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constant {
        static let hexColor9D9DA1 = "HexColor9D9DA1"
        static let hexColor121212 = "HexColor121212"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    // MARK: - Private Methods
    
    func setupUI() {
        navigationController?.tabBarController?.tabBar.unselectedItemTintColor = UIColor(named: Constant.hexColor9D9DA1)
        navigationController?.tabBarController?.tabBar.backgroundColor = UIColor(named: Constant.hexColor121212)
    }

}
