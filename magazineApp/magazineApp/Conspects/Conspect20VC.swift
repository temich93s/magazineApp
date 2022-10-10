//
//  Conspect20VC.swift
//  magazineApp
//
//  Created by 2lup on 09.10.2022.
//

// MARK: Видеоурок 20 - UIPageViewController + lazy + Constraints/programmatically

/*
import UIKit

/// Conspect20VC
class Conspect20VC: UIViewController {
    
    // MARK: - Image
    
    private let carImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        // Логическое значение, указывающее, привязаны ли подслои к границам слоя.
        view.layer.masksToBounds = true
        // Логическое значение, определяющее, преобразуется ли маска автоматической настройки представления в ограничения автоматической компоновки. (нужно что бы вместо автолаяута у нас работали констрейнты)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Label
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // помещаем существующие view в массив
    lazy var subView: [UIView] = [self.carImage, self.nameLabel]
    
    // MARK: - Init
    
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .purple
        
        // edgesForExtendedLayout - Края, которые вы расширяете для своего контроллера просмотра.
        edgesForExtendedLayout = []
        
        carImage.image = carWith.image
        nameLabel.text = carWith.name
        for view in subView {
            self.view.addSubview(view)
        }
        
        // констрейнты
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: carImage, attribute: .height, relatedBy: .equal,
                                    toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint.init(item: carImage, attribute: .width, relatedBy: .equal,
                                    toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint.init(item: carImage, attribute: .top, relatedBy: .equal,
                                    toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint.init(item: carImage, attribute: .centerX, relatedBy: .equal,
                                    toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: nameLabel, attribute: .top, relatedBy: .equal,
                                    toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint.init(item: nameLabel, attribute: .centerX, relatedBy: .equal,
                                    toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
*/
 
// MARK: - код для SceneDelegate

/*
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
        
        let vc = MyViewController()
        let navController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        //        window = UIWindow(frame: UIScreen.main.bounds)
        //        window?.backgroundColor = UIColor.white
        //        window?.makeKeyAndVisible()
        //        window?.rootViewController = UINavigationController(rootViewController: MyViewController())
    }
    
}
*/
