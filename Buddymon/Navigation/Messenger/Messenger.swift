//
//  Messenger.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation

public protocol Messenger {
    var alert: AlertMessage { get }
    var loader: Loadable { get }
}

public protocol AlertMessage {
    func show(message: String?)
    func show(message: String?, dismiss: @escaping (AlertResponse) -> Void)
    func show(message: String?, cancel: String, confirm: String, dismiss: @escaping (AlertResponse) -> Void)
    func show(message: String?, confirm: String, dismiss: @escaping (AlertResponse) -> Void)
}

public enum AlertResponse {
    case canceled
    case confirmed
}

public protocol Loadable {
    func showLoading()
    func stopLoading()
}
