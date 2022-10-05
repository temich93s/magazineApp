//
//  MainTabBarController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

// MARK: - MainTabBarController

/// Основной таб бар приложения
class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    // MARK: - Private Methods
    
    private func setTabBar() {
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
        
        tabBar.unselectedItemTintColor = Constant.unselectedItemTintColor
        viewControllers = [buyViewController, forYouViewController, searchViewController, basketViewController]
    }
    
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
}
