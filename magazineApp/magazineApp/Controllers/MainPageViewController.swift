//
//  StartPageViewController.swift
//  magazineApp
//
//  Created by 2lup on 12.10.2022.
//

import UIKit

/// экран приветствия
final class MainPageViewController: UIPageViewController {
    
    // MARK: - Constants

    private enum Constant {
        static let pageStartNameImage = "page1"
        static let pageMidleNameImage = "page2"
        static let pageFinishNameImage = "page3"
        static let nextText = "NEXT"
        static let skipText = "SKIP"
        static let getStartedText = "GET STARTED!"
        static let mainTextForStartVC = "Track You Cycle"
        static let secondaryTextForStartVC = "Manage irregular period learn how to improve your peiod"
        static let mainTextForMidleVC = "Plan Your Pregnancy"
        static let secondaryTextForMidleVC = "Favorable days important. Vestibulum rutrum quam vitae fringila tincidunt"
        static let mainTextForFinishVC = "Daily Health Insight"
        static let secondaryTextForFinishVC = "Personal health insight." +
            "Vestibulum rutrum quam vitae fringilla tincidunt."
        static let TimesNewRomanBold = "TimesNewRomanPS-BoldMT"
        static let TimesNewRoman = "TimesNewRomanPSMT"
    }
    
    // MARK: - Private Visual Properties
    
    private let startViewController = OnboardViewController(backgroundImageName: Constant.pageStartNameImage)
    private let midleViewController = OnboardViewController(backgroundImageName: Constant.pageMidleNameImage)
    private let finishViewController = OnboardViewController(backgroundImageName: Constant.pageFinishNameImage)
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: view.frame.maxX - 130, y: view.frame.maxY - 70, width: 100, height: 40))
        button.setTitle(Constant.nextText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(goToNextPageAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var skipButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: view.frame.maxY - 70, width: 100, height: 40))
        button.setTitle(Constant.skipText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(goToMainTabBarAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: view.frame.maxY - 70, width: 150, height: 40))
        button.center.x = view.center.x
        button.setTitle(Constant.getStartedText, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(goToMainTabBarAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: view.frame.maxY - 250, width: 350, height: 50))
        label.center.x = view.center.x
        label.textAlignment = .center
        label.font = UIFont(name: Constant.TimesNewRomanBold, size: 35)
        label.text = Constant.mainTextForStartVC
        return label
    }()
    
    private lazy var secondaryMessage: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: view.frame.maxY - 200, width: 350, height: 60))
        label.center.x = view.center.x
        label.textAlignment = .center
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = UIFont(name: Constant.TimesNewRoman, size: 20)
        label.text = Constant.secondaryTextForStartVC
        return label
    }()
    
    private lazy var mainPageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: view.frame.maxY - 70, width: 200, height: 40))
        pageControl.center.x = view.center.x
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = welcomeViewControllers.count
        pageControl.currentPage = 0
        return pageControl
    }()
    
    // MARK: - Private Properties
    
    private lazy var welcomeViewControllers: [UIViewController] = [
        startViewController, midleViewController, finishViewController
    ]
    
    private var currentIndex: Int {
        guard let vc = viewControllers?.first else { return 0 }
        return welcomeViewControllers.firstIndex(of: vc) ?? 0
    }
    
    // MARK: - init
    
    override init(
        transitionStyle style: UIPageViewController.TransitionStyle,
        navigationOrientation: UIPageViewController.NavigationOrientation,
        options: [UIPageViewController.OptionsKey: Any]? = nil
    ) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainPageVC()
    }
    
    // MARK: - Private Action
    
    @objc private func goToNextPageAction() {
        guard currentIndex < 2 else { return }
        setViewControllers([welcomeViewControllers[currentIndex + 1]], direction: .forward, animated: true)
        mainPageControl.currentPage += 1
        doAnimation()
        guard currentIndex == 2 else { return }
        nextButton.isHidden = true
        skipButton.isHidden = true
        getStartedButton.isHidden = false
        mainMessage.text = Constant.mainTextForFinishVC
        secondaryMessage.text = Constant.secondaryTextForFinishVC
        mainPageControl.isHidden = true
    }
    
    @objc private func goToMainTabBarAction() {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen
        present(mainTabBarController, animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    
    private func doAnimation() {
        mainMessage.alpha = 0
        secondaryMessage.alpha = 0
        UIView.animate(withDuration: 1.2, animations: {
            self.mainMessage.alpha = 1
            self.secondaryMessage.alpha = 1
        })
    }
    
    private func setupMainPageVC() {
        view.addSubview(mainPageControl)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        view.addSubview(getStartedButton)
        view.addSubview(mainMessage)
        view.addSubview(secondaryMessage)
        dataSource = self
        delegate = self
        view.backgroundColor = .white
        guard let firstVC = welcomeViewControllers.first else { return }
        setViewControllers([firstVC], direction: .forward, animated: true)
    }
    
}

// MARK: - UIPageViewControllerDataSource, UIPageViewControllerDelegate
extension MainPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard
            let vc = viewController as? OnboardViewController,
            let index = welcomeViewControllers.firstIndex(of: vc),
            index > 0
        else {
            return nil
        }
        return welcomeViewControllers[index - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard
            let vc = viewController as? OnboardViewController,
            let index = welcomeViewControllers.firstIndex(of: vc),
            index < welcomeViewControllers.count - 1
        else {
            return nil
        }
        return welcomeViewControllers[index + 1]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return welcomeViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            willTransitionTo pendingViewControllers: [UIViewController]) {
        guard
            let vc = pendingViewControllers.first as? OnboardViewController,
            let index = welcomeViewControllers.firstIndex(of: vc)
        else {
            return
        }
        mainPageControl.currentPage = index
        doAnimation()
        switch index {
        case 0, 1:
            nextButton.isHidden = false
            skipButton.isHidden = false
            getStartedButton.isHidden = true
            mainPageControl.isHidden = false
            guard index == 0 else {
                mainMessage.text = Constant.mainTextForMidleVC
                secondaryMessage.text = Constant.secondaryTextForMidleVC
                return
            }
            mainMessage.text = Constant.mainTextForStartVC
            secondaryMessage.text = Constant.secondaryTextForStartVC
        case 2:
            nextButton.isHidden = true
            skipButton.isHidden = true
            getStartedButton.isHidden = false
            mainMessage.text = Constant.mainTextForFinishVC
            secondaryMessage.text = Constant.secondaryTextForFinishVC
            mainPageControl.isHidden = true
        default:
            break
        }
    }
    
}
