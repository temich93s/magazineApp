//
//  SceneDelegate.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Constants

    private enum Constants {
        static let isNotFirstLaunchKey = "isFirstLaunch5"
    }
    
    // MARK: - Private Visual Properties
    
    var window: UIWindow?
    private var isFirstLaunch = 0
    private var isNotFirstLaunchBool = false
    
    // MARK: - Lifecycle
    
    func scene(
        _ scene: UIScene,
        willConnectTo session:
        UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        loadStatusLaunch()
        if isNotFirstLaunchBool {
            window?.rootViewController = MainTabBarController()
        } else {
            isNotFirstLaunchBool = true
            saveStatusLaunch()
            window?.rootViewController = MainPageViewController()
        }
    }
    
    // MARK: - Private Methods
    
    private func saveStatusLaunch() {
        UserDefaults.standard.set(isNotFirstLaunchBool, forKey: Constants.isNotFirstLaunchKey)
    }
    
    private func loadStatusLaunch() {
        isNotFirstLaunchBool = UserDefaults.standard.bool(forKey: Constants.isNotFirstLaunchKey)
    }
    
}
