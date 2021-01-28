//
//  UIViewController+Extension.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 28/01/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    public typealias Action = ()->()
    
    func showHud() {
        let backgroundView = UIView()
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        backgroundView.backgroundColor = .lightGray
        backgroundView.tag = 123
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 75, height: 75))
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .gray
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
        backgroundView.addSubview(activityIndicator)
        view.addSubview(backgroundView)
    }
    
    func hideHud() {
        view.viewWithTag(123)?.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }
    
    func showAlert(message: String, action: Action? = nil) {
        let alert = UIAlertController(title: "Buddymon", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            action?()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
