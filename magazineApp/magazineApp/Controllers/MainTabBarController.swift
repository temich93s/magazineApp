//
//  MainTabBarController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// Основной таб бар приложения
class MainTabBarController: UITabBarController {
    
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
        static let unselectedItemTintColor = UIColor.gray
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
        
        let forYouViewController = ForYouViewController()
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
        
        tabBar.unselectedItemTintColor = Constant.unselectedItemTintColor
        
        viewControllers = [
            navigationControllerBuy,
            navigationControllerForYou,
            navigationControllerSearch,
            navigationControllerBasket
        ]
    }
    
}
