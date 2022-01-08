//
//  SystemAlertMessenger.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

public final class SystemAlertMessenger {
    
    private func alert(message: String? = nil,
                       confirm: String? = nil,
                       cancel: String? = nil,
                       dismiss: ((AlertResponse) -> Void)? = nil) {
        
        if Thread.isMainThread == false {
            DispatchQueue.main.async { self.alert(message: message, confirm: confirm, cancel: cancel, dismiss: dismiss) }
            return
        }
        
        let alert = UIAlertController(title: "Buddymon", message: message, preferredStyle: .alert)
        
        if let confirm = confirm {
            let action = UIAlertAction(title: confirm, style: .default) { _ in
                dismiss?(.confirmed)
            }
            alert.addAction(action)
        }
        
        if let cancel = cancel {
            let action = UIAlertAction(title: cancel, style: .cancel) { _ in
                dismiss?(.canceled)
            }
            alert.addAction(action)
        }
            
        alert.modalTransitionStyle = .crossDissolve
        alert.modalPresentationStyle = .overCurrentContext
        UIApplication.shared.keyWindow?.rootViewController?.lastViewController?.present(alert, animated: true)
    }
    
}

extension SystemAlertMessenger: AlertMessage {
    public func show(message: String?) {
        alert(message: message)
    }
    
    public func show(message: String?, dismiss: @escaping (AlertResponse) -> Void) {
        alert(message: message, dismiss: dismiss)
    }
    
    public func show(message: String?, cancel: String, confirm: String, dismiss: @escaping (AlertResponse) -> Void) {
        alert(message: message, confirm: confirm, cancel: cancel, dismiss: dismiss)
    }
    
    public func show(message: String?, confirm: String, dismiss: @escaping (AlertResponse) -> Void) {
        alert(message: message, confirm: confirm, dismiss: dismiss)
    }
    
}
