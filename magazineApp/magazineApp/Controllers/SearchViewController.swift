//
//  SearchViewController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// Страница с поиском товара
class SearchViewController: UIViewController {

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
        static let whiteColor = UIColor.white
        static let darkGrayColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        static let lightGrayColor = UIColor.lightGray
        static let systemBlueColor = UIColor.systemBlue
    }
    
    // MARK: - Private Properties
    
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
    
    private let queryOptionsLabel: UILabel = {
        $0.textColor = Constant.whiteColor
        $0.text = Constant.wordQueryOptions
        $0.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeforBoldWord)
        return $0
    }(UILabel())
    
    private let backgroundForProductsCaseBlackView: UIView = {
        $0.backgroundColor = Constant.darkGrayColor
        $0.isUserInteractionEnabled = false
        return $0
    }(UIView())
    
    private lazy var productCaseBlackImageView: UIImageView = {
        $0.image = UIImage(named: Constant.imageCaseBlack)
        $0.contentMode = .scaleAspectFit
        $0.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(goToProductViewControllerFromCaseBlack)
        ))
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    private let productCaseBlackNameLabel: UILabel = {
        $0.textColor = Constant.whiteColor
        $0.text = Constant.descriptionCaseBlack
        $0.numberOfLines = Constant.numberZero
        $0.font = UIFont.systemFont(ofSize: Constant.fontSizeforCommonWord)
        return $0
    }(UILabel())

    private let backgroundForProductsBlackUnityView: UIView = {
        $0.backgroundColor = Constant.darkGrayColor
        $0.isUserInteractionEnabled = false
        return $0
    }(UIView())
    
    private lazy var productBlackUnityImageView: UIImageView = {
        $0.image = UIImage(named: Constant.imageBlackUnity)
        $0.contentMode = .scaleAspectFit
        $0.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(goToProductViewControllerFromBlackUnity)
        ))
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    private let productBlackUnityNameLabel: UILabel = {
        $0.textColor = Constant.whiteColor
        $0.text = Constant.descriptionBlackUnity
        $0.numberOfLines = Constant.numberZero
        $0.font = UIFont.systemFont(ofSize: Constant.fontSizeforCommonWord)
        return $0
    }(UILabel())
    
    private let backgroundForProductsCaseBrownView: UIView = {
        $0.backgroundColor = Constant.darkGrayColor
        $0.isUserInteractionEnabled = false
        return $0
    }(UIView())
    
    private lazy var productCaseBrownImageView: UIImageView = {
        $0.image = UIImage(named: Constant.imageCaseBrown)
        $0.contentMode = .scaleAspectFit
        $0.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(goToProductViewControllerFromCaseBrown)
        ))
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    private let productCaseBrownNameLabel: UILabel = {
        $0.textColor = Constant.whiteColor
        $0.text = Constant.descriptionCaseBrown
        $0.numberOfLines = Constant.numberZero
        $0.font = UIFont.systemFont(ofSize: Constant.fontSizeforCommonWord)
        return $0
    }(UILabel())
    
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
    
    @objc private func goToProductViewControllerFromCaseBlack(sender: UIView) {
        let productViewController = ProductViewController()
        productViewController.productText = Constant.descriptionCaseBlack
        productViewController.productImage = Constant.imageCaseBlack
        navigationController?.pushViewController(productViewController, animated: true)
    }
    
    @objc private func goToProductViewControllerFromBlackUnity(sender: UIView) {
        let productViewController = ProductViewController()
        productViewController.productText = Constant.descriptionBlackUnity
        productViewController.productImage = Constant.imageBlackUnity
        navigationController?.pushViewController(productViewController, animated: true)
    }
    
    @objc private func goToProductViewControllerFromCaseBrown(sender: UIView) {
        let productViewController = ProductViewController()
        productViewController.productText = Constant.descriptionCaseBrown
        productViewController.productImage = Constant.imageCaseBrown
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
        setupBackgroundForProductsCaseBlackView()
        setupProductCaseBlackImageView()
        setupProductCaseBlackNameLabel()
        setupBackgroundForProductsBlackUnityView()
        setupProductBlackUnityImageView()
        setupProductBlackUnityNameLabel()
        setupBackgroundForProductsCaseBrownView()
        setupProductCaseBrownImageView()
        setupProductCaseBrownNameLabel()
        setupQueryOptionsLabel()
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
    
    private func setupBackgroundForProductsCaseBlackView() {
        view.addSubview(backgroundForProductsCaseBlackView)
        backgroundForProductsCaseBlackView.frame = CGRect(
            x: 20,
            y: recentlyViewedLabel.frame.maxY + 10,
            width: 150,
            height: 210
        )
        backgroundForProductsCaseBlackView.layer.cornerRadius = backgroundForProductsCaseBlackView.frame.height
            / Constant.numberForCornerRadius
    }
    
    private func setupProductCaseBlackImageView() {
        view.addSubview(productCaseBlackImageView)
        productCaseBlackImageView.frame = CGRect(
            x: 35,
            y: recentlyViewedLabel.frame.maxY + 20,
            width: 120,
            height: 120
        )
    }
    
    private func setupProductCaseBlackNameLabel() {
        view.addSubview(productCaseBlackNameLabel)
        productCaseBlackNameLabel.frame = CGRect(
            x: 30,
            y: recentlyViewedLabel.frame.maxY + 150,
            width: 130,
            height: 60
        )
    }
    
    private func setupBackgroundForProductsBlackUnityView() {
        view.addSubview(backgroundForProductsBlackUnityView)
        backgroundForProductsBlackUnityView.frame = CGRect(
            x: 180,
            y: recentlyViewedLabel.frame.maxY + 10,
            width: 150,
            height: 210
        )
        backgroundForProductsBlackUnityView.layer.cornerRadius = backgroundForProductsBlackUnityView.frame.height
            / Constant.numberForCornerRadius
    }
    
    private func setupProductBlackUnityImageView() {
        view.addSubview(productBlackUnityImageView)
        productBlackUnityImageView.frame = CGRect(
            x: 195,
            y: recentlyViewedLabel.frame.maxY + 20,
            width: 120,
            height: 120
        )
    }
    
    private func setupProductBlackUnityNameLabel() {
        view.addSubview(productBlackUnityNameLabel)
        productBlackUnityNameLabel.frame = CGRect(
            x: 190,
            y: recentlyViewedLabel.frame.maxY + 150,
            width: 130,
            height: 60
        )
    }
    
    private func setupBackgroundForProductsCaseBrownView() {
        view.addSubview(backgroundForProductsCaseBrownView)
        backgroundForProductsCaseBrownView.frame = CGRect(
            x: 340,
            y: recentlyViewedLabel.frame.maxY + 10,
            width: 150,
            height: 210
        )
        backgroundForProductsCaseBrownView.layer.cornerRadius = backgroundForProductsCaseBrownView.frame.height
            / Constant.numberForCornerRadius
    }
    
    private func setupProductCaseBrownImageView() {
        view.addSubview(productCaseBrownImageView)
        productCaseBrownImageView.frame = CGRect(
            x: 355,
            y: recentlyViewedLabel.frame.maxY + 20,
            width: 120,
            height: 120
        )
    }
    
    private func setupProductCaseBrownNameLabel() {
        view.addSubview(productCaseBrownNameLabel)
        productCaseBrownNameLabel.frame = CGRect(
            x: 350,
            y: recentlyViewedLabel.frame.maxY + 150,
            width: 130,
            height: 60
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
    
    private func createLastQueryView(lastQueryText: String, index: Int) {
        let lastQueryButton: UIButton = {
            $0.setImage(UIImage(systemName: Constant.imageMagnifyingGlass), for: .normal)
            $0.tintColor = Constant.lightGrayColor
            $0.titleLabel?.font = UIFont.systemFont(ofSize: Constant.fontSizeforBoldWord)
            $0.setTitle(lastQueryText, for: .normal)
            $0.contentHorizontalAlignment = .left
            return $0
        }(UIButton())
        
        view.addSubview(lastQueryButton)
        
        lastQueryButton.frame = CGRect(
            x: 30,
            y: recentlyViewedLabel.frame.maxY + 300 + (CGFloat(index) * 50),
            width: view.bounds.width - 60,
            height: 40
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
