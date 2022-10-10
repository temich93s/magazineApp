//
//  ForYouViewController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// Страница со списком товара для пользователя
final class ForYouViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constant {
        static let HexColor3478F7 = "HexColor3478F7"
        static let HexColorF8F8F8 = "HexColorF8F8F8"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    // MARK: - Private Methods
    
    func setupUI() {
        navigationController?.tabBarController?.tabBar.unselectedItemTintColor = UIColor(named: Constant.HexColor3478F7)
        navigationController?.tabBarController?.tabBar.backgroundColor = UIColor(named: Constant.HexColorF8F8F8)
    }

}
