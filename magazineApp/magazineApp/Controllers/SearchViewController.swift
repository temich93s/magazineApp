//
//  SearchViewController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

// MARK: - SearchViewController

/// Страница с поиском товара
class SearchViewController: UIViewController {

    private let searchLabel: UILabel = {
        $0.textColor = Constant.whiteColor
        $0.text = Constant.wordSearch
        $0.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeWordSearch)
        return $0
    }(UILabel())
    
    private let backgroundForSearchView: UIView = {
        $0.backgroundColor = Constant.darkGrayColor
        $0.isUserInteractionEnabled = false
        return $0
    }(UIView())
    
    private let searchButton: UIButton = {
        $0.setImage(UIImage(systemName: Constant.imageMagnifyingGlass), for: .normal)
        $0.tintColor = Constant.lightGrayColor
        return $0
    }(UIButton())
    
    private let searchTextField: UITextField = {
        $0.textColor = Constant.lightGrayColor
        $0.attributedPlaceholder = NSAttributedString(
            string: Constant.placeholderForSearch,
            attributes: [NSAttributedString.Key.foregroundColor: Constant.lightGrayColor]
        )
        $0.placeholder = Constant.placeholderForSearch
        return $0
    }(UITextField())
    
    private let recentlyViewedLabel: UILabel = {
        $0.textColor = Constant.whiteColor
        $0.text = Constant.wordRecentlyViewed
        $0.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeforBoldWord)
        return $0
    }(UILabel())
    
    private let clearButton: UIButton = {
        $0.setTitle(Constant.wordClear, for: .normal)
        $0.setTitleColor(Constant.systemBlueColor, for: .normal)
        return $0
    }(UIButton())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.addSubview(searchLabel)
        view.addSubview(backgroundForSearchView)
        view.addSubview(searchButton)
        view.addSubview(searchTextField)
        view.addSubview(recentlyViewedLabel)
        view.addSubview(clearButton)
        
        searchLabel.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 40)
        backgroundForSearchView.frame = CGRect(
            x: 20,
            y: searchLabel.frame.maxY + 10,
            width: view.bounds.width - 40,
            height: 40
        )
        searchButton.frame = CGRect(x: 20, y: 0, width: 40, height: 40)
        searchButton.center.y = backgroundForSearchView.center.y
        searchTextField.frame = CGRect(x: 60, y: 0, width: view.bounds.width - 90, height: 40)
        searchTextField.center.y = backgroundForSearchView.center.y
        recentlyViewedLabel.frame = CGRect(
            x: 20,
            y: backgroundForSearchView.frame.maxY + 50,
            width: view.bounds.width - 140,
            height: 40
        )
        clearButton.frame = CGRect(
            x: view.frame.maxX - 110,
            y: backgroundForSearchView.frame.maxY + 50,
            width: 100,
            height: 40
        )
        
        backgroundForSearchView.layer.cornerRadius = backgroundForSearchView.frame.height / Constant.numberFour
        
        createProductView(productImage: Constant.imageCaseBlack, productText: Constant.descriptionCaseBlack, index: 0)
        createProductView(productImage: Constant.imageBlackUnity, productText: Constant.descriptionBlackUnity, index: 1)
        createProductView(productImage: Constant.imageCaseBrown, productText: Constant.descriptionCaseBrown, index: 2)
    }
    
    private func createProductView(productImage: String, productText: String, index: Int) {
        
        let backgroundForProductsView: UIView = {
            $0.backgroundColor = Constant.darkGrayColor
            $0.isUserInteractionEnabled = false
            return $0
        }(UIView())
        
        let productImageView: UIImageView = {
            $0.image = UIImage(named: productImage)
            $0.contentMode = .scaleAspectFit
            return $0
        }(UIImageView())
        
        let productNameLabel: UILabel = {
            $0.textColor = Constant.whiteColor
            $0.text = productText
            $0.numberOfLines = Constant.numberZero
            $0.font = UIFont.systemFont(ofSize: Constant.fontSizeforCommonWord)
            return $0
        }(UILabel())
        
        view.addSubview(backgroundForProductsView)
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        
        backgroundForProductsView.frame = CGRect(
            x: 20 + (CGFloat(index) * 160),
            y: recentlyViewedLabel.frame.maxY + 10,
            width: 150,
            height: 210
        )
        productImageView.frame = CGRect(
            x: 35 + (CGFloat(index) * 160),
            y: recentlyViewedLabel.frame.maxY + 20,
            width: 120,
            height: 120
        )
        productNameLabel.frame = CGRect(
            x: 30 + (CGFloat(index) * 160),
            y: recentlyViewedLabel.frame.maxY + 150,
            width: 130,
            height: 60
        )
        
        backgroundForProductsView.layer.cornerRadius = backgroundForProductsView.frame.height
            / Constant.numberForCornerRadius
    }
    
    // MARK: - Constants
    
    private enum Constant {
        static let fontSizeWordSearch: CGFloat = 40
        static let fontSizeforBoldWord: CGFloat = 22
        static let fontSizeforCommonWord: CGFloat = 15
        static let numberFour: CGFloat = 4
        static let numberForCornerRadius: CGFloat = 20
        static let numberZero = 0
        static let wordSearch = "Поиск"
        static let wordRecentlyViewed = "Недавно просмотренные"
        static let wordClear = "Очистить"
        static let imageMagnifyingGlass = "magnifyingglass"
        static let placeholderForSearch = "Поиск по продуктам и магазинам"
        static let descriptionCaseBlack = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let imageCaseBlack = "CaseBlack"
        static let descriptionBlackUnity = "Спортивный ремешок Black Unity"
        static let imageBlackUnity = "BlackUnity"
        static let descriptionCaseBrown = "Кожанный чехол Brown для MacBook Pro 16 дюймов"
        static let imageCaseBrown = "CaseBrown"
        static let whiteColor = UIColor.white
        static let darkGrayColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        static let lightGrayColor = UIColor.lightGray
        static let systemBlueColor = UIColor.systemBlue
        
    }
    
}
