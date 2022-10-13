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
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .black
    }

}
