//
//  MiddleViewController.swift
//  magazineApp
//
//  Created by 2lup on 12.10.2022.
//

import UIKit

/// один из экранов приветствия
final class OnboardViewController: UIViewController {
    
    // MARK: - Private Visual Properties
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 550))
        imageView.image = UIImage(named: backgroundImage)
        return imageView
    }()
    
    // MARK: - Private Properties
    
    private var backgroundImage = ""
    
    // MARK: - init
    
    required init(backgroundImageName: String) {
        backgroundImage = backgroundImageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backgroundImageView)
    }
    
}
