//
//  ProductViewController.swift
//  magazineApp
//
//  Created by 2lup on 06.10.2022.
//

import UIKit

/// Страница с выбранным пользователем товаром
final class ProductViewController: UIViewController {

    // MARK: - Constants
    
    private enum Constant {
        static let fontSizeWordSearch: CGFloat = 40
        static let fontSizeforCommonWord: CGFloat = 17
        static let fontSizeforDescriptionProduct: CGFloat = 13
        static let heartImage = "heart"
        static let imageSquareAndArrowUpImage = "square.and.arrow.up"
        static let imagSquareCheckmarkCircle = "checkmark.circle.fill"
        static let imageShippingBox = "shippingbox"
        static let textCostProduct = "3 990.00 руб."
        static let textCompatibilityCommonPart = "Совместимо с "
        static let textCompatibilityPersonalPart = "MacBook Pro - Евгений"
        static let textCommonDelivery = "Заказ сегодня в течениии дня, доставка"
        static let textDateDelivery = "Чт 25 Фев - Бесплатно"
        static let textDescriptionDelivery = "Варианты доставки для местоположения 115533"
        static let textAddToBasket = "Добавить корзину"
        static let colorBackdroundView = "HexColor89878C"
        static let colorLightProductView = "HexColor9D9DA1"
        static let colorDarkProductView = "HexColor3F3D40"
        static let colorCheckmarkCircle = "HexColor2FD15C"
    }
    
    // MARK: - Public Properties
    
    var productText = ""
    var imagesProduct: [String] = []
    
    // MARK: - Private Visual Properties
    
    private var nameProductView = UILabel()
    private var costProductView = UILabel()
    private var imageProductScrollView = UIScrollView()
    private var descriptionProductLabel = UILabel()
    private var colorLightProductButton = UIButton()
    private var colorDarkProductButton = UIButton()
    private var compatibilityIndicatorImageView = UIImageView()
    private var compatibilityTextLabel = UILabel()
    private var addToBasketButton = UIButton()
    private var textCommonDeliveryLabel = UILabel()
    private var textDateDeliveryLabel = UILabel()
    private var textDescriptionDeliveryLabel = UILabel()
    private var shippingBoxImageView = UIImageView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        guard let colorBackdround = UIColor(named: Constant.colorBackdroundView) else { return }
        view.backgroundColor = .black
        navigationItem.setRightBarButtonItems(
            [UIBarButtonItem(image: UIImage(systemName: Constant.heartImage),
                             style: .plain, target: nil, action: nil),
             UIBarButtonItem(image: UIImage(systemName: Constant.imageSquareAndArrowUpImage),
                             style: .plain, target: nil, action: nil)],
            animated: true
        )
        
        nameProductView = createNameProductView(
            positionX: 10, positionY: 100,
            width: view.bounds.width - 20, height: 45)
        view.addSubview(nameProductView)
        
        costProductView = createCostProductView(
            positionX: 10, positionY: nameProductView.frame.maxY,
            width: view.bounds.width - 20, height: 20)
        view.addSubview(costProductView)
        
        imageProductScrollView = createImageProductScrollView(
            images: imagesProduct,
            positionX: 0, positionY: costProductView.frame.maxY + 20,
            width: view.bounds.width, height: 270)
        view.addSubview(imageProductScrollView)
        
        descriptionProductLabel = createDescriptionProductLabel(
            positionX: 0, positionY: imageProductScrollView.frame.maxY + 20,
            width: view.bounds.width, height: 15)
        view.addSubview(descriptionProductLabel)
        
        colorLightProductButton = createColorProductButton(
            isActive: false, color: Constant.colorLightProductView,
            positionX: view.bounds.width / 2 - 50, positionY: descriptionProductLabel.frame.maxY + 35,
            width: 40, height: 40)
        view.addSubview(colorLightProductButton)
        
        colorDarkProductButton = createColorProductButton(
            isActive: true, color: Constant.colorDarkProductView,
            positionX: view.bounds.width / 2 + 10, positionY: descriptionProductLabel.frame.maxY + 35,
            width: 40, height: 40)
        view.addSubview(colorDarkProductButton)
        
        compatibilityIndicatorImageView = createCompatibilityIndicatorImageView(
            positionX: 70, positionY: colorDarkProductButton.frame.maxY + 35,
            width: 20, height: 20)
        view.addSubview(compatibilityIndicatorImageView)
        
        compatibilityTextLabel = createCompatibilityTextLabel(
            positionX: 100, positionY: colorDarkProductButton.frame.maxY + 35,
            width: 250, height: 20)
        view.addSubview(compatibilityTextLabel)
        
        addToBasketButton = createAddToBasketButton(
            positionX: 5, positionY: compatibilityTextLabel.frame.maxY + 35,
            width: view.bounds.width - 10, height: 50)
        view.addSubview(addToBasketButton)
        
        textCommonDeliveryLabel = createDeliveryLabel(
            text: Constant.textCommonDelivery, textColor: .white,
            positionX: 50, positionY: addToBasketButton.frame.maxY + 35,
            width: view.bounds.width - 60, height: 18)
        textCommonDeliveryLabel.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeforDescriptionProduct)
        view.addSubview(textCommonDeliveryLabel)
        
        textDateDeliveryLabel = createDeliveryLabel(
            text: Constant.textDateDelivery, textColor: colorBackdround,
            positionX: 50, positionY: textCommonDeliveryLabel.frame.maxY,
            width: view.bounds.width - 60, height: 18)
        view.addSubview(textDateDeliveryLabel)
        
        textDescriptionDeliveryLabel = createDeliveryLabel(
            text: Constant.textDescriptionDelivery, textColor: .systemBlue,
            positionX: 50, positionY: textDateDeliveryLabel.frame.maxY,
            width: view.bounds.width - 60, height: 18)
        view.addSubview(textDescriptionDeliveryLabel)
        
        shippingBoxImageView = createShippingBoxImageView(
            positionX: 15, positionY: addToBasketButton.frame.maxY + 35,
            width: 20, height: 20)
        view.addSubview(shippingBoxImageView)
    }
    
    // MARK: - Private Visual Methods
    
    private func createNameProductView(
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UILabel {
        let label = UILabel()
        label.text = productText
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeforCommonWord)
        label.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        return label
    }
    
    private func createCostProductView(
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UILabel {
        let label = UILabel()
        label.text = Constant.textCostProduct
        label.textColor = UIColor(named: Constant.colorBackdroundView)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: Constant.fontSizeforCommonWord)
        label.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        return label
    }
    
    private func createImageProductView(productImage: String, index: Int) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: productImage)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: CGFloat(index) * view.bounds.width, y: 0, width: view.bounds.width, height: 260)
        return imageView
    }
    
    private func createImageProductScrollView(
        images: [String],
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UIScrollView {
        let scrollView = UIScrollView()
        for indexImage in 0..<images.count {
            let imageProductView = createImageProductView(productImage: imagesProduct[indexImage], index: indexImage)
            scrollView.addSubview(imageProductView)
        }
        scrollView.contentSize = CGSize(width: view.bounds.width * CGFloat(images.count), height: height)
        view.addSubview(scrollView)
        scrollView.frame = CGRect(
            x: positionX,
            y: positionY,
            width: width,
            height: height
        )
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.indicatorStyle = .black
        
        let backgroundLabel = UIView()
        backgroundLabel.backgroundColor = UIColor(named: Constant.colorBackdroundView)
        backgroundLabel.frame = CGRect(
            x: 0, y: scrollView.bounds.maxY - 6,
            width: view.bounds.width * CGFloat(images.count), height: 3)
        scrollView.addSubview(backgroundLabel)
        
        return scrollView
    }
    
    private func createDescriptionProductLabel(
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UILabel {
        let label = UILabel()
        label.text = productText
        label.textColor = UIColor(named: Constant.colorBackdroundView)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: Constant.fontSizeforDescriptionProduct)
        label.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        return label
    }
    
    private func createColorProductButton(
        isActive: Bool, color: String,
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        button.backgroundColor = UIColor(named: color)
        button.layer.cornerRadius = button.bounds.height / 2
        
        guard isActive else { return button }
        let borderView = UIView()
        borderView.layer.borderColor = UIColor.systemBlue.cgColor
        borderView.layer.borderWidth = 2
        borderView.frame = CGRect(x: -5, y: -5, width: width + 10, height: height + 10)
        borderView.layer.cornerRadius = (button.bounds.height + 10) / 2
        borderView.isUserInteractionEnabled = false
        button.addSubview(borderView)
        return button
    }
    
    private func createCompatibilityIndicatorImageView(
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constant.imagSquareCheckmarkCircle)
        imageView.tintColor = UIColor(named: Constant.colorCheckmarkCircle)
        imageView.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        return imageView
    }
    
    private func createCompatibilityTextLabel(
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UILabel {
        let label = UILabel()
        guard let colorCompatibilityCommonPart = UIColor(named: Constant.colorBackdroundView) else { return label }
        let resultText = NSMutableAttributedString(
            string: Constant.textCompatibilityCommonPart,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: Constant.fontSizeforDescriptionProduct),
                NSAttributedString.Key.foregroundColor: colorCompatibilityCommonPart
            ])
        resultText.append(NSMutableAttributedString(
            string: Constant.textCompatibilityPersonalPart,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: Constant.fontSizeforDescriptionProduct),
                NSAttributedString.Key.foregroundColor: UIColor.systemBlue
            ]))
        label.attributedText = resultText
        label.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        return label
    }
    
    private func createAddToBasketButton(
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = button.bounds.height / 4
        button.setTitle(Constant.textAddToBasket, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: Constant.fontSizeforCommonWord)
        return button
    }
    
    private func createDeliveryLabel(
        text: String, textColor: UIColor,
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: Constant.fontSizeforDescriptionProduct)
        label.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        return label
    }
    
    private func createShippingBoxImageView(
        positionX: CGFloat, positionY: CGFloat, width: CGFloat, height: CGFloat
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constant.imageShippingBox)
        imageView.tintColor = UIColor(named: Constant.colorBackdroundView)
        imageView.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        return imageView
    }
}
