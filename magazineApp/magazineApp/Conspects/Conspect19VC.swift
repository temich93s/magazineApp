//
//  Conspect19VC.swift
//  magazineApp
//
//  Created by 2lup on 09.10.2022.
//

// MARK: Видеоурок 19 - UIProgressView + Timer + private + final class

/*
import UIKit

/// Conspect19VC
final class Conspect19VC: UIViewController {
    
    // swift и xcode автоматически генерит ссылки на не приватные свойства/методы несмотря на то, что мы их не используем, это все тратит время и ресурсы
    
    private let myProgressView = UIProgressView()
    private let myButton = UIButton()
      var myTime = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createProgress(myProgressView)
        createButton(myButton)
        createTimer()
    }
    
    // MARK: - Timer
    
    private func createTimer() {
        myTime = Timer.scheduledTimer(timeInterval: 0.4, target: self,
                                      selector: #selector(updateProgressView),
                                      userInfo: nil, repeats: true)
    }
    
    // MARK: - Selector
    
    @objc private func updateProgressView(sender: Timer) {
        print(sender.timeInterval)
        print(myProgressView.progress)
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.1
        } else if myProgressView.progress == 1.0 {
            // animate - Анимируйте изменения в одном или нескольких представлениях, используя указанный обработчик продолжительности и завершения.
            UIView.animate(withDuration: 0.7, animations: {
                print("animate - start")
                self.myButton.alpha = 1
                self.myButton.setTitle("Go", for: .normal)
                self.myTime.invalidate()
            }, completion: nil)
        }
    }
    
    // MARK: - UI
    
    private func createProgress(_ progressView: UIProgressView) {
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = .green
        progressView.trackTintColor = .gray
        progressView.center = view.center
        view.addSubview(progressView)
    }
    
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.size.width / 4, y: view.center.y + 100, width: 150, height: 50)
        button.setTitle("Load", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.alpha = 0.2
        view.addSubview(button)
    }
    
}
*/
