//
//  SearchViewController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// Страница с поиском товара
final class SearchViewController: UIViewController {

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
        static let wordQueryOptions = "Варианты запросов"
        static let imageMagnifyingGlass = "magnifyingglass"
        static let placeholderForSearch = "Поиск по продуктам и магазинам"
        static let descriptionCaseBlack = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let imageCaseBlack = "CaseBlack"
        static let descriptionBlackUnity = "Спортивный ремешок Black Unity"
        static let imageBlackUnity = "BlackUnity"
        static let descriptionCaseBrown = "Кожанный чехол Brown для MacBook Pro 16 дюймов"
        static let imageCaseBrown = "CaseBrown"
        static let wordAirPods = "  AirPods"
        static let wordAppleCare = "  AppleCare"
        static let wordBeats = "  Beats"
        static let wordCompareModelIphone = "  Сравните модели iphone"
    }
    
    // MARK: - Private Visual Components
    
    private let searchLabel: UILabel = {
        $0.textColor = .white
        $0.text = Constant.wordSearch
        $0.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeWordSearch)
        return $0
    }(UILabel())
    
    private let backgroundForSearchView: UIView = {
        $0.backgroundColor = UIColor(named: "HexColor1C1C1E")
        $0.isUserInteractionEnabled = false
        return $0
    }(UIView())
    
    private let searchButton: UIButton = {
        $0.setImage(UIImage(systemName: Constant.imageMagnifyingGlass), for: .normal)
        $0.tintColor = .lightGray
        return $0
    }(UIButton())
    
    private let searchTextField: UITextField = {
        $0.textColor = .lightGray
        $0.attributedPlaceholder = NSAttributedString(
            string: Constant.placeholderForSearch,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        $0.placeholder = Constant.placeholderForSearch
        return $0
    }(UITextField())
    
    private let recentlyViewedLabel: UILabel = {
        $0.textColor = .white
        $0.text = Constant.wordRecentlyViewed
        $0.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeforBoldWord)
        return $0
    }(UILabel())
    
    private let clearButton: UIButton = {
        $0.setTitle(Constant.wordClear, for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        return $0
    }(UIButton())
    
    private let queryOptionsLabel: UILabel = {
        $0.textColor = .white
        $0.text = Constant.wordQueryOptions
        $0.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeforBoldWord)
        return $0
    }(UILabel())
    
    // MARK: - Private Properties
    
    private let products = [
        (productText: Constant.descriptionCaseBlack, productImage: Constant.imageCaseBlack),
        (productText: Constant.descriptionBlackUnity, productImage: Constant.imageBlackUnity),
        (productText: Constant.descriptionCaseBrown, productImage: Constant.imageCaseBrown)
    ]
    
    private let lastQueryArray = [
        Constant.wordAirPods,
        Constant.wordAppleCare,
        Constant.wordBeats,
        Constant.wordCompareModelIphone
    ]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegate()
    }
    
    // MARK: - Private Methods
    
    @objc private func goToProductViewController(sender: UITapGestureRecognizer) {
        guard
            let tag = sender.view?.tag,
            tag < products.count
        else { return }
        let productViewController = ProductViewController()
        productViewController.productText = products[tag].productText
        productViewController.productImage = products[tag].productImage
        navigationController?.pushViewController(productViewController, animated: true)
    }
    
    private func setupDelegate() {
        searchTextField.delegate = self
    }
    
    private func setupUI() {
        setupSearchLabel()
        setupBackgroundForSearchView()
        setupSearchButton()
        setupSearchTextField()
        setupRecentlyViewedLabel()
        setupClearButton()
        setupQueryOptionsLabel()
        for indexProduct in 0..<products.count {
            createProductView(
                productText: products[indexProduct].productText,
                productImage: products[indexProduct].productImage,
                index: indexProduct
            )
        }
        for indexLastQuery in 0..<lastQueryArray.count {
            createLastQueryView(lastQueryText: lastQueryArray[indexLastQuery], index: indexLastQuery)
        }
    }
    
    private func setupSearchLabel() {
        view.addSubview(searchLabel)
        searchLabel.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 40)
    }
    
    private func setupBackgroundForSearchView() {
        view.addSubview(backgroundForSearchView)
        backgroundForSearchView.frame = CGRect(
            x: 20,
            y: searchLabel.frame.maxY + 10,
            width: view.bounds.width - 40,
            height: 40
        )
        backgroundForSearchView.layer.cornerRadius = backgroundForSearchView.frame.height / Constant.numberFour
    }

    private func setupSearchButton() {
        view.addSubview(searchButton)
        searchButton.frame = CGRect(x: 20, y: 0, width: 40, height: 40)
        searchButton.center.y = backgroundForSearchView.center.y
    }
    
    private func setupSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.frame = CGRect(x: 60, y: 0, width: view.bounds.width - 90, height: 40)
        searchTextField.center.y = backgroundForSearchView.center.y
    }
    
    private func setupRecentlyViewedLabel() {
        view.addSubview(recentlyViewedLabel)
        recentlyViewedLabel.frame = CGRect(
            x: 20,
            y: backgroundForSearchView.frame.maxY + 50,
            width: view.bounds.width - 140,
            height: 40
        )
    }
    
    private func setupClearButton() {
        view.addSubview(clearButton)
        clearButton.frame = CGRect(
            x: view.frame.maxX - 110,
            y: backgroundForSearchView.frame.maxY + 50,
            width: 100,
            height: 40
        )
    }
 
    private func setupQueryOptionsLabel() {
        view.addSubview(queryOptionsLabel)
        queryOptionsLabel.frame = CGRect(
            x: 20,
            y: recentlyViewedLabel.frame.maxY + 250,
            width: view.bounds.width - 40,
            height: 40
        )
    }
    
    private func createProductView(productText: String, productImage: String, index: Int) {
        
        let backgroundForProductsView: UIView = {
            $0.backgroundColor = UIColor(named: "HexColor1C1C1E")
            $0.isUserInteractionEnabled = false
            return $0
        }(UIView())
        
        let productImageView: UIImageView = {
            $0.image = UIImage(named: productImage)
            $0.contentMode = .scaleAspectFit
            $0.tag = index
            $0.addGestureRecognizer(UITapGestureRecognizer(
                target: self,
                action: #selector(goToProductViewController)
            ))
            $0.isUserInteractionEnabled = true
            return $0
        }(UIImageView())
        
        let productNameLabel: UILabel = {
            $0.textColor = .white
            $0.text = productText
            $0.numberOfLines = Constant.numberZero
            $0.font = UIFont.systemFont(ofSize: Constant.fontSizeforCommonWord)
            return $0
        }(UILabel())
        
        view.addSubview(backgroundForProductsView)
        backgroundForProductsView.frame = CGRect(
            x: 20 + (CGFloat(index) * 160),
            y: recentlyViewedLabel.frame.maxY + 10,
            width: 150,
            height: 210
        )
        backgroundForProductsView.layer.cornerRadius = backgroundForProductsView.frame.height
        / Constant.numberForCornerRadius
        
        view.addSubview(productImageView)
        productImageView.frame = CGRect(
            x: 35 + (CGFloat(index) * 160),
            y: recentlyViewedLabel.frame.maxY + 20,
            width: 120,
            height: 120
        )
        
        view.addSubview(productNameLabel)
        productNameLabel.frame = CGRect(
            x: 30 + (CGFloat(index) * 160),
            y: recentlyViewedLabel.frame.maxY + 150,
            width: 130,
            height: 60
        )
    }
    
    private func createLastQueryView(lastQueryText: String, index: Int) {
        let lastQueryButton: UIButton = {
            $0.setImage(UIImage(systemName: Constant.imageMagnifyingGlass), for: .normal)
            $0.tintColor = .lightGray
            $0.titleLabel?.font = UIFont.systemFont(ofSize: Constant.fontSizeforBoldWord)
            $0.setTitle(lastQueryText, for: .normal)
            $0.contentHorizontalAlignment = .left
            return $0
        }(UIButton())
        
        let lineView: UIView = {
            $0.backgroundColor = UIColor(named: "HexColor1C1C1E")
            return $0
        }(UIButton())
        
        view.addSubview(lastQueryButton)
        view.addSubview(lineView)
        
        lastQueryButton.frame = CGRect(
            x: 30,
            y: recentlyViewedLabel.frame.maxY + 300 + (CGFloat(index) * 50),
            width: view.bounds.width - 60,
            height: 40
        )
        lineView.frame = CGRect(
            x: 30,
            y: recentlyViewedLabel.frame.maxY + 345 + (CGFloat(index) * 50),
            width: view.bounds.width - 60,
            height: 1
        )
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}