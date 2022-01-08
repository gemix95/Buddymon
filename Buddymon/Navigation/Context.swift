//
//  Context.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation

public struct Context {
    public let navigator: Navigator
    public let messenger: Messenger
    
    public init(navigator: Navigator, messenger: Messenger) {
        self.messenger = messenger
        self.navigator = navigator
    }
}
