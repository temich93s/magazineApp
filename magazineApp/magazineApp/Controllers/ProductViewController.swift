//
//  ProductViewController.swift
//  magazineApp
//
//  Created by 2lup on 06.10.2022.
//

import UIKit

/// Страница с выбранным пользователем товаром
class ProductViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constant {
        static let fontSizeWordSearch: CGFloat = 40
        static let whiteColor = UIColor.white
        static let blackColor = UIColor.black
    }
    
    // MARK: - Public Properties
    
    var (productImage, productText) = ("", "")
    
    // MARK: - Private Properties
    
    private lazy var productTextLabel: UILabel = {
        $0.textColor = Constant.whiteColor
        $0.text = productText
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeWordSearch)
        return $0
    }(UILabel())
    
    private lazy var productImageView: UIImageView = {
        $0.image = UIImage(named: productImage)
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = Constant.blackColor
        setupProductImageView()
        setupProductTextLabel()
    }
    
    private func setupProductTextLabel() {
        view.addSubview(productTextLabel)
        productTextLabel.frame = CGRect(
            x: 20,
            y: productImageView.frame.maxY + 10,
            width: view.frame.width - 40,
            height: 300
        )
    }
    
    private func setupProductImageView() {
        view.addSubview(productImageView)
        productImageView.frame = CGRect(
            x: 20,
            y: 100,
            width: view.frame.width - 40,
            height: view.frame.width - 40
        )
    }
    
}
