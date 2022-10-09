//
//  Conspect18VC.swift
//  magazineApp
//
//  Created by 2lup on 09.10.2022.
//

// MARK: Видеоурок 18 - UIWebView, UIActivityIndicator, openPDF

/*
import UIKit

/// Conspect18VC
class Conspect18VC: UIViewController, UIWebViewDelegate {
    
    // MARK: Вместо UIWebView (устарел) используем WKWebView
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var goBackItem: UIBarButtonItem!
    @IBOutlet weak var goForwardItem: UIBarButtonItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // UIApplication - Централизованная точка контроля и координации для приложений, работающих в iOS.
    // shared - Одиночный экземпляр приложения.
    let application = UIApplication.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        // Логическое значение, определяющее, масштабируется ли веб-страница в соответствии с представлением, и пользователь может изменить масштаб.
        webView.scalesPageToFit = true
        
        // Bundle - Представление кода и ресурсов, хранящихся в каталоге пакета на диске.
        // main - Возвращает объект bundle, содержащий текущий исполняемый файл.
        // url - Возвращает URL-адрес файла для ресурса, идентифицируемого указанным именем и расширением файла.
//        if let urlPDF = Bundle.main.url(forResource: "iOS+Syllabus", withExtension: "pdf") {
//            let request = URLRequest(url: urlPDF)
//            webView.loadRequest(request)
//        }
        
        if let myURL = URL(string: "https://swiftbook.ru/contents/doc/") {
            print(myURL.port, myURL.user, myURL.scheme)
            let request = URLRequest(url: myURL)
            // Подключается к заданному URL-адресу, инициируя асинхронный клиентский запрос.
            webView.loadRequest(request)
        }
        
    }
    
    // MARK: - Action
    
    @IBAction func goBackAction(_ sender: UIBarButtonItem) {
        // Логическое значение, указывающее, может ли приемник двигаться назад.
        if webView.canGoBack {
            // Загружает предыдущее местоположение в списке "Назад-вперед".
            webView.goBack()
        }
    }
    
    @IBAction func goForwardAction(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        // Перезагружает текущую страницу.
        webView.reload()
    }
    
    // MARK: - UIWebViewDelegate
    
    // Отправляется после того, как веб-представления начинает загружать фрейм.
    func webViewDidStartLoad(_ webView: UIWebView) {
        isWorkIndicator(isAnimated: true, indicator: activityIndicator)
        goBackItem.isEnabled = false
        goForwardItem.isEnabled = false
    }

    // Отправляется после завершения загрузки фрейма в веб-представлении.
    func webViewDidFinishLoad(_ webView: UIWebView) {
        isWorkIndicator(isAnimated: false, indicator: activityIndicator)
        if webView.canGoBack {
            goBackItem.isEnabled = true
        }
        if webView.canGoForward {
            goForwardItem.isEnabled = true
        }
    }
    
    // Отправлено до того, как веб-представлено начнет загружать фрейм.
    func webView(
        _ webView: UIWebView,
        shouldStartLoadWith request: URLRequest,
        navigationType: UIWebView.NavigationType
    ) -> Bool {
        print("shouldStartLoadWith = ", request)
        return true
    }
    
    // MARK: - Method
    
    func isWorkIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView) {
        // Логическое значение, которое включает или выключает индикатор сетевой активности.
        application.isNetworkActivityIndicatorVisible = isAnimated
        if isAnimated {
            // Запускает анимацию индикатора выполнения.
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
}
*/
