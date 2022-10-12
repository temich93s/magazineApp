//
//  SceneDelegate.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session:
        UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        window?.rootViewController = MainTabBarController()
    }
    
}
