//
//  MainTabBarController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// Основной таб бар приложения
final class MainTabBarController: UITabBarController {
    
    // MARK: - Constants
    
    private enum Constant {
        static let imageLaptopComputerAndIphone = "laptopcomputer.and.iphone"
        static let imagePersonCircle = "person.circle"
        static let imageMagnifyingGlass = "magnifyingglass"
        static let imageBag = "bag"
        static let wordBuy = "Купить"
        static let wordForYou = "Для вас"
        static let wordSearch = "Поиск"
        static let wordBasket = "Корзина"
        static let wordMain = "Main"
        static let wordForYouVC = "ForYouVC"
        static let hexColor121212 = "HexColor121212"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - Private Methods
    
    private func setupTabBar() {
        let buyViewController = BuyViewController()
        buyViewController.tabBarItem.title = Constant.wordBuy
        buyViewController.tabBarItem.image = UIImage(systemName: Constant.imageLaptopComputerAndIphone)
        
        let storyboard = UIStoryboard.init(name: Constant.wordMain, bundle: Bundle.main)
        let forYouViewController = storyboard.instantiateViewController(identifier: Constant.wordForYouVC)
        forYouViewController.tabBarItem.title = Constant.wordForYou
        forYouViewController.tabBarItem.image = UIImage(systemName: Constant.imagePersonCircle)
        
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem.title = Constant.wordSearch
        searchViewController.tabBarItem.image = UIImage(systemName: Constant.imageMagnifyingGlass)

        let basketViewController = BasketViewController()
        basketViewController.tabBarItem.title = Constant.wordBasket
        basketViewController.tabBarItem.image = UIImage(systemName: Constant.imageBag)
        
        let navigationControllerBuy = UINavigationController(rootViewController: buyViewController)
        let navigationControllerForYou = UINavigationController(rootViewController: forYouViewController)
        let navigationControllerSearch = UINavigationController(rootViewController: searchViewController)
        let navigationControllerBasket = UINavigationController(rootViewController: basketViewController)
        
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = UIColor(named: Constant.hexColor121212)
        
        viewControllers = [
            navigationControllerBuy,
            navigationControllerForYou,
            navigationControllerSearch,
            navigationControllerBasket
        ]
    }
    
}
