//
//  ActivityLoader.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

final class ActivityLoader: Loadable {
    var activityView: UIActivityIndicatorView?
    var backgroundView: UIView?
    let tag = 995
    
    func showLoading() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.showLoading() }
            return
        }
        
        guard let window = UIApplication.shared.keyWindow else { return }
        
        stopLoading()
        backgroundView = UIView()
        backgroundView?.tag = tag
        activityView = makeLoader()
        
        guard let backgroundView = self.backgroundView, let activityView = self.activityView else { return }
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(backgroundView)
        backgroundView.contentMode = .center
        backgroundView.backgroundColor = .lightGray
        backgroundView.pinEdges(to: window)
        
        window.layoutIfNeeded()
        
        activityView.center = backgroundView.center
        backgroundView.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func stopLoading() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async { self.stopLoading() }
            return
        }
        UIApplication.shared.windows.forEach { window in
            window.removeAllSubViews(tag: tag)
        }
        activityView = nil
        backgroundView = nil
    }
    
    func makeLoader() -> UIActivityIndicatorView {
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 75, height: 75))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .gray
        activityIndicator.color = .white
        return activityIndicator
    }
}
