//
//  StartPageViewController.swift
//  magazineApp
//
//  Created by 2lup on 12.10.2022.
//

import UIKit

/*
class MainPageViewController: UIPageViewController {
    
    private var rocketsData: [Rocket]?
    private var launchesData: [Launches]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var networkManagerRockets = NetworkManagerRockets()
        networkManagerRockets.delegate = self
        rocketsData = networkManagerRockets.performRequest()
        
        var networkManagerLaunches = NetworkManagerLaunches()
        networkManagerLaunches.delegate = self
        launchesData = networkManagerLaunches.performRequest()
        
        // устанавливаем себя источником данных для UIPageViewControllerDataSource
        self.dataSource = self
        
    }
}

// MARK: - UIPageViewControllerDataSource
extension MainPageViewController: UIPageViewControllerDataSource {
    
    // viewControllerBefore - возвращаем предыдущий ViewController
    // return nil - означает, что страница предыдущая/следующая не существует
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // получаем индекс предыдущего ViewController
        let index = ((viewController as? SpaceRocketInfoViewController)?.index ?? 0) - 1
        return createPageViewController(for: index)
    }
    
    // viewControllerBefore - возвращаем следующуй ViewController
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // получаем индекс следующего ViewController
        let index = ((viewController as? SpaceRocketInfoViewController)?.index ?? 0) + 1
        return createPageViewController(for: index)
    }
    
    // метод генерирующий ViewController для определенного индекса
    func createPageViewController(for index: Int) -> UIViewController? {
        // проверяем что бы мы не вышли за пределы количества ViewController
        if (index < 0) || (index > 3) {
            return nil
        } else {
            // instantiateViewController - Создает ViewController с указанным идентификатором (storyboard ID) и инициализирует его данными из storyboard
            // И кастим результат до нашего кастомного ViewController
            let vc = storyboard?.instantiateViewController(withIdentifier: "SpaceRocketInfoSID") as? SpaceRocketInfoViewController
            vc?.index = index
            vc?.rocketData = rocketsData?[index]
            vc?.launchesData = launchesData
            return vc
        }
    }
}
*/
