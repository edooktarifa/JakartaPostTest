//
//  BaseViewController.swift
//  JakartaPostTest
//
//  Created by Phincon on 22/09/22.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    let loading = NVActivityIndicatorView(frame: .zero, type: .circleStrokeSpin, color: UIColor.red)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoading()
    }
    
    func setupLoading(){
        self.loading.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.loading)
        
        NSLayoutConstraint.activate([
            self.loading.widthAnchor.constraint(equalToConstant: 40),
            self.loading.heightAnchor.constraint(equalToConstant: 40),
            self.loading.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loading.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Missing password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func stopLoading(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.loading.stopAnimating()
        }
    }
}

