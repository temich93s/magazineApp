//
//  BasketViewController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// Страница выбранных товаров пользователем
final class BasketViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constant {
        static let HexColor9D9DA1 = "HexColor9D9DA1"
        static let HexColor121212 = "HexColor121212"
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
        navigationController?.tabBarController?.tabBar.unselectedItemTintColor = UIColor(named: Constant.HexColor9D9DA1)
        navigationController?.tabBarController?.tabBar.backgroundColor = UIColor(named: Constant.HexColor121212)
    }

}
