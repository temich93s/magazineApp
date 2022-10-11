//
//  WebStoreViewController.swift
//  magazineApp
//
//  Created by 2lup on 10.10.2022.
//

import UIKit
import WebKit

/// Cтраница интернет магазина
class WebStoreViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Constants
    
    private enum Constant {
        static let imageCharacterBookClosedImage = "character.book.closed"
        static let pricePDF = "App-Store-Price"
        static let textPrice = "Price"
        static let hexColorF8F8F8 = "HexColorF8F8F8"
    }
    
    // MARK: - Private Visual Properties
    
    private var webStoreWebView = WKWebView()
    private let myProgressView = UIProgressView()
    private var myTime = Timer()
    
    // MARK: - Public Properties
    
    var productURL = ""
    
    // MARK: - Private Properties
    
    private let urlPDF = Bundle.main.url(forResource: Constant.pricePDF, withExtension: "pdf")
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProductWebView()
        setupWebStoreVC()
        setupUI()
        setupToolBar()
        setupNavigationBar()
        createProgress(myProgressView)
    }
    
    // MARK: - Private Visual Methods
    
    private func createProgress(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.center = view.center
        view.addSubview(progressView)
    }
    
    private func loadProductWebView() {
        guard let myURL = URL(string: productURL) else { return }
        let myRequest = URLRequest(url: myURL)
        webStoreWebView.uiDelegate = self
        webStoreWebView.isHidden = true
        webStoreWebView.load(myRequest)
        createTimer()
    }
    
    private func setupNavigationBar() {
        navigationItem.setRightBarButtonItems(
            [UIBarButtonItem(title: Constant.textPrice, style: .plain, target: nil, action: #selector(openPDF))],
            animated: true
        )
    }

    private func setupWebStoreVC() {
        view.backgroundColor = UIColor(named: Constant.hexColorF8F8F8)
    }
    
    private func setupToolBar() {
        navigationController?.isToolbarHidden = false
        var items: [UIBarButtonItem] = []
        items.append(UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(undoPage)))
        items.append(UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: #selector(redoPage)))
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        items.append(UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePage)))
        items.append(UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshPage)))
        toolbarItems = items
    }
    
    private func startItemSharingWithActivityVC(item: Any?) {
        guard let saveItem = item else { return }
        let safeActivityVC = UIActivityViewController(activityItems: [saveItem], applicationActivities: nil)
        present(safeActivityVC, animated: true, completion: nil)
    }
    
    // MARK: - Private Action
    
    @objc private func openPDF() {
        guard let safeUrlPDF = urlPDF else { return }
        let request = URLRequest(url: safeUrlPDF)
        webStoreWebView.load(request)
        createTimer()
    }
    
    @objc private func undoPage() {
        guard webStoreWebView.canGoBack else { return }
        webStoreWebView.goBack()
    }
    
    @objc private func redoPage() {
        guard webStoreWebView.canGoForward else { return }
        webStoreWebView.goForward()
    }
    
    @objc private func savePage() {
        startItemSharingWithActivityVC(item: webStoreWebView.url)
    }
    
    @objc func refreshPage() {
        webStoreWebView.reload()
    }
    
    @objc private func updateProgressView(sender: Timer) {
        if webStoreWebView.estimatedProgress == 1.0 {
            myTime.invalidate()
            webStoreWebView.isHidden = false
            myProgressView.isHidden = true
        } else {
            print(webStoreWebView.estimatedProgress)
            webStoreWebView.isHidden = true
            myProgressView.isHidden = false
            myProgressView.setProgress(Float(webStoreWebView.estimatedProgress), animated: true)
        }
    }
    
    // MARK: - Private Methods
    
    private func createTimer() {
        myTime = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                      selector: #selector(updateProgressView),
                                      userInfo: nil, repeats: true)
    }
    
    private func setupUI() {
        webStoreWebView.frame = CGRect(x: 0, y: 90, width: view.frame.width, height: view.frame.height - 90)
        view.addSubview(webStoreWebView)
    }
    
}
