//
//  MyViewController.swift
//  magazineApp
//
//  Created by 2lup on 09.10.2022.
//

// MARK: Видеоурок 20 - UIPageViewController + lazy + Constraints/programmatically

/*
import UIKit

/// MyPageVC
class MyViewController: UIPageViewController {

    // MARK: - Variable
    
    var cars: [CarsHelper] = []
    let bmw = UIImage(named: "CaseBlack")
    let audi = UIImage(named: "CaseBrown")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cars"
        
        if let safeBMW = bmw, let safeAUDI = audi {
            let firstCar = CarsHelper(name: "CaseBlack - bmw", image: safeBMW)
            let secondCar = CarsHelper(name: "CaseBrown - audi", image: safeAUDI)
            cars.append(firstCar)
            cars.append(secondCar)
        }
    }
    
    // MARK: - createVC
    lazy var arrayCarVC: [Conspect20VC] = {
        var carsVC: [Conspect20VC] = []
        for car in cars {
            carsVC.append(Conspect20VC(carWith: car))
        }
        return carsVC
    }()

    // MARK: - init
    override init(
        transitionStyle style: UIPageViewController.TransitionStyle,
        navigationOrientation: UIPageViewController.NavigationOrientation,
        options: [UIPageViewController.OptionsKey: Any]? = nil
    ) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        view.backgroundColor = .green
        
        // установка делегатов и датасоурс
        self.dataSource = self
        self.delegate = self
        
        // Задает отображаемые контроллеры представления.
        setViewControllers([arrayCarVC[0]], direction: .forward, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MyViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // что отобразить когда идем вперед
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let vc = viewController as? Conspect20VC else { return nil }
        if let index = arrayCarVC.index(of: vc) {
            if index > 0 {
                return arrayCarVC[index - 1]
            }
        }
        return nil
    }
    
    // что отобразить когда идем назад
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let vc = viewController as? Conspect20VC else { return nil }
        if let index = arrayCarVC.index(of: vc) {
            if index < cars.count - 1 {
                return arrayCarVC[index + 1]
            }
        }
        return nil
    }
    
    // Возвращает количество элементов, которые будут отражены в индикаторе страницы.
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return cars.count
    }
    
    // Возвращает индекс выбранного элемента, который будет отражен в индикаторе страницы.
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
*/
