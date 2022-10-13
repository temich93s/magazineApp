//
//  MiddleViewController.swift
//  magazineApp
//
//  Created by 2lup on 12.10.2022.
//

import UIKit

/// один из экранов приветсвия
class OnboardViewController: UIViewController {

    var backgroundImage = ""
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 550))
        imageView.image = UIImage(named: backgroundImage)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backgroundImageView)
    }
    
    required init(backgroundImageName: String) {
        backgroundImage = backgroundImageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
