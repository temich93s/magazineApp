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
    
    private enum Constant {
        static let hexColor9D9DA1 = "hexColor9D9DA1"
        static let hexColorF8F8F8 = "HexColorF8F8F8"
        static let hexColor1C1C1E = "HexColor1C1C1E"
        static let keyForPersonPhoto = "PersonPhoto"
        static let imagePickerControllerEditedImage = "UIImagePickerControllerEditedImage"
        static let shadowRadius: CGFloat = 5
        static let shadowOpacity: Float = 0.5
        static let cornerRadius: CGFloat = 20
    }
    
    // MARK: - Private @IBOutlet
    
    @IBOutlet private weak var deliveryProductView: UIView!
    @IBOutlet private weak var personPhotoImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupDeliveryProductView()
        setupPersonPhotoImageView()
        loadImage()
        changeModeToLight()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        changeModeToDark()
    }
    
    // MARK: - Private Visual Methods
    
    private func setupPersonPhotoImageView() {
        personPhotoImageView.layer.cornerRadius = personPhotoImageView.frame.height / 2
        personPhotoImageView.addGestureRecognizer(UITapGestureRecognizer(
            target: self, action: #selector(changePersonPhotoAction)))
    }
    
    private func setupDeliveryProductView() {
        deliveryProductView.layer.cornerRadius = Constant.cornerRadius
        deliveryProductView.layer.shadowColor = CGColor(gray: 0, alpha: 1)
        deliveryProductView.layer.shadowOpacity = Constant.shadowOpacity
        deliveryProductView.layer.shadowOffset = CGSize.zero
        deliveryProductView.layer.shadowRadius = Constant.shadowRadius
    }
    
    // MARK: - Private Action
    
    @objc private func changePersonPhotoAction() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func saveImage() {
        guard let dataPersonPhoto = personPhotoImageView.image?.pngData() else { return }
        do {
            let encoded = try PropertyListEncoder().encode(dataPersonPhoto)
            UserDefaults.standard.set(encoded, forKey: Constant.keyForPersonPhoto)
        } catch {
            print(error)
        }
    }
    
    private func loadImage() {
        guard let dataPersonPhoto = UserDefaults.standard.data(forKey: Constant.keyForPersonPhoto) else { return }
        do {
            let decoded = try PropertyListDecoder().decode(Data.self, from: dataPersonPhoto)
            personPhotoImageView.image = UIImage(data: decoded)
        } catch {
            print(error)
        }
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

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ForYouViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        guard let image = info[UIImagePickerController.InfoKey(
            rawValue: Constant.imagePickerControllerEditedImage)] as? UIImage else { return }
        personPhotoImageView.image = image
        saveImage()
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
