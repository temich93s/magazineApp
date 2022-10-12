//
//  ForYouViewController.swift
//  magazineApp
//
//  Created by 2lup on 05.10.2022.
//

import UIKit

/// Страница со списком товара для пользователя
final class ForYouViewController: UIViewController {
    
    // MARK: - Constants
    
    enum Constants {
        static let keyForPersonPhoto = "PersonPhoto"
        static let nameVC = "Для вас"
        static let whatIsNewText = "Вот что нового"

        static let orderStatusText = "Ваш заказ отправлен."
        static let orderDetailsText = "1 товар, доставка завтра"
        static let orderDescriptionProcessedText = "Обрабатывается"
        static let orderDescriptionShippedText = "Отправлено"
        static let orderDescriptionDeliveredText = "Доставлено"
        
        static let recommendationForYouText = "Рекомендуется вам"
        static let recommendationMainText = "Получайте новости о своем заказе в режиме реального времени."
        static let recommendationSecondaryText = "Включите уведомления, чтобы получать новости о своем заказе."
        
        static let yourDevicesText = "ваши устройства"
        static let showAllText = "Показать все"
        
        static let airpodsImageName = "Airpods"
        static let defaultPersonImageName = "person.circle.fill"
        static let chevronRightImageName = "chevron.right"
        static let squareImageName = "Square"
        
        static let imagePickerControllerEditedImage = "UIImagePickerControllerEditedImage"
    }

    // MARK: - Private Visual Properties
    
    private lazy var mainScrollView: UIScrollView = {
        guard let safeBarWidth = navigationController?.navigationBar.frame.maxY else { return UIScrollView() }
        let scrollView = UIScrollView(frame: CGRect(
            x: 0, y: safeBarWidth,
            width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = view.frame.size
        return scrollView
    }()

    private lazy var upperSeparatorView: UIView = {
        let view = UIView(frame: CGRect(x: 15, y: 0, width: placeholderView.frame.width, height: 0.5))
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var whatIsNewLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 16, y: 10, width: view.frame.width, height: 80))
        label.textColor = .black
        label.textAlignment = .left
        label.text = Constants.whatIsNewText
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    private lazy var placeholderView: UIView = {
        let view = UIView(frame: CGRect(x: 16, y: 80, width: view.frame.width - 32, height: 150))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 10
        return view
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 60, height: 60))
        imageView.image = UIImage(named: Constants.airpodsImageName)
        return imageView
    }()
    
    private lazy var orderStatusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 86, y: 16, width: 200, height: 30))
        label.textColor = .black
        label.text = Constants.orderStatusText
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private lazy var orderDetailsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 86, y: 40, width: 200, height: 30))
        label.text = Constants.orderDetailsText
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    private lazy var moreInformationImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 355, y: 35, width: 10, height: 14))
        view.image = UIImage(systemName: Constants.chevronRightImageName)
        view.tintColor = .gray
        return view
    }()
    
    private lazy var middleSeparatorView: UIView = {
        let dividerView = UIView(frame: CGRect(x: 0, y: 100, width: placeholderView.frame.width, height: 0.5))
        dividerView.backgroundColor = .gray
        return dividerView
    }()
    
    private lazy var orderProgressView: UIProgressView = {
        let progressView = UIProgressView(frame: CGRect(
            x: 16, y: 115,
            width: placeholderView.frame.width - 32, height: 4))
        progressView.progressTintColor = .systemGreen
        progressView.progress = 0.5
        return progressView
    }()
    
    private lazy var orderDescriptionProcessedLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 16, y: 125, width: 130, height: 15))
        label.text = Constants.orderDescriptionProcessedText
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    private lazy var orderDescriptionShippedLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 156, y: 125, width: 130, height: 15))
        label.text = Constants.orderDescriptionShippedText
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    private lazy var orderDescriptionDeliveredLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 296, y: 125, width: 130, height: 15))
        label.text = Constants.orderDescriptionDeliveredText
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private lazy var recommendationForYouLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.recommendationForYouText
        label.font = .boldSystemFont(ofSize: 23)
        label.frame = CGRect(x: 16, y: 260, width: view.frame.width, height: 80)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 40, y: 350, width: 40, height: 40))
        imageView.image = UIImage(named: Constants.squareImageName)
        return imageView
    }()

    private lazy var recommendationMainLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 105, y: 330, width: 250, height: 100))
        label.text = Constants.recommendationMainText
        label.numberOfLines = 3
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var recommendationSecondaryLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 105, y: 390, width: 270, height: 80))
        label.text = Constants.recommendationSecondaryText
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.textColor = .gray
        return label
    }()
    
    private lazy var chevronRightImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 375, y: 400, width: 10, height: 14))
        imageView.image = UIImage(systemName: Constants.chevronRightImageName)
        imageView.tintColor = .gray
        return imageView
    }()
    
    private lazy var lowerSeparatorView: UIView = {
        let view = UIView(frame: CGRect(x: 16, y: 500, width: placeholderView.frame.width, height: 0.5))
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var yourDevicesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 16, y: 540, width: 350, height: 80))
        label.text = Constants.yourDevicesText
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()

    private lazy var showAllButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(Constants.showAllText, for: .normal)
        button.frame = CGRect(x: 260, y: 555, width: 150, height: 50)
        return button
    }()
    
    private var personPhotoButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doBigNavigationBar()
        changeModeToLight()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        doSmallNavigationBar()
        changeModeToDark()
    }
    
    // MARK: - Private Action
    
    @objc private func rightButtonTapped() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.modalPresentationStyle = .formSheet
        present(picker, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .white
        title = Constants.nameVC
        addPersonPhotoButtonToNavigationBar()
        mainScrollView.addSubview(upperSeparatorView)
        mainScrollView.addSubview(whatIsNewLabel)
        placeholderView.addSubview(productImageView)
        placeholderView.addSubview(orderStatusLabel)
        placeholderView.addSubview(orderDetailsLabel)
        placeholderView.addSubview(moreInformationImageView)
        placeholderView.addSubview(middleSeparatorView)
        placeholderView.addSubview(orderProgressView)
        placeholderView.addSubview(orderDescriptionProcessedLabel)
        placeholderView.addSubview(orderDescriptionShippedLabel)
        placeholderView.addSubview(orderDescriptionDeliveredLabel)
        mainScrollView.addSubview(placeholderView)
        mainScrollView.addSubview(recommendationForYouLabel)
        mainScrollView.addSubview(newsImageView)
        mainScrollView.addSubview(recommendationMainLabel)
        mainScrollView.addSubview(recommendationSecondaryLabel)
        mainScrollView.addSubview(chevronRightImageView)
        mainScrollView.addSubview(lowerSeparatorView)
        mainScrollView.addSubview(yourDevicesLabel)
        mainScrollView.addSubview(showAllButton)
        view.addSubview(mainScrollView)
    }
    
    private func doBigNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func doSmallNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func addPersonPhotoButtonToNavigationBar() {
        personPhotoButton.frame = CGRect(x: view.frame.width, y: 0, width: 30, height: 30)
        personPhotoButton.setImage(loadImage().resizeImage(to: CGSize(width: 30, height: 30)), for: .normal)
        personPhotoButton.layer.cornerRadius = 15
        personPhotoButton.clipsToBounds = true
        personPhotoButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        navigationController?.navigationBar.addSubview(personPhotoButton)
        personPhotoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: personPhotoButton, attribute: .trailingMargin,
                relatedBy: .equal,
                toItem: navigationController?.navigationBar, attribute: .trailingMargin,
                multiplier: 1.0, constant: -20),
            NSLayoutConstraint(
                item: personPhotoButton, attribute: .bottom,
                relatedBy: .equal,
                toItem: navigationController?.navigationBar, attribute: .bottom,
                multiplier: 1.0, constant: -10)
        ])
    }
    
    private func saveImage() {
        guard let dataPersonPhoto = personPhotoButton.image(for: .normal)?.pngData() else { return }
        do {
            let encoded = try PropertyListEncoder().encode(dataPersonPhoto)
            UserDefaults.standard.set(encoded, forKey: Constants.keyForPersonPhoto)
        } catch {
            print(error)
        }
    }
    
    private func loadImage() -> UIImage {
        guard
            let dataPersonPhoto = UserDefaults.standard.data(forKey: Constants.keyForPersonPhoto)
        else {
            return UIImage(named: Constants.defaultPersonImageName) ?? UIImage()
        }
        do {
            let decoded = try PropertyListDecoder().decode(Data.self, from: dataPersonPhoto)
            return UIImage(data: decoded) ?? UIImage()
        } catch {
            print(error)
        }
        return UIImage()
    }
    
    private func changeModeToLight() {
        tabBarController?.overrideUserInterfaceStyle = .light
        overrideUserInterfaceStyle = .light
    }
    
    private func changeModeToDark() {
        tabBarController?.overrideUserInterfaceStyle = .dark
        overrideUserInterfaceStyle = .dark
    }
    
}

// MARK: - Extension UIImage

extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

// MARK: UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ForYouViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let image = info[UIImagePickerController.InfoKey(
            rawValue: Constants.imagePickerControllerEditedImage)] as? UIImage else { return }
        let resizeImage = image.resizeImage(to: CGSize(width: 30, height: 30))
        personPhotoButton.setImage(resizeImage, for: .normal)
        saveImage()
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
