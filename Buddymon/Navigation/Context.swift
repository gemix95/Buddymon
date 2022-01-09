//
//  Context.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import CoreNetwork

public struct Context {
    public let navigator: Navigator
    public let messenger: Messenger
    public let networker: NetworkServices
    
    public init(navigator: Navigator, messenger: Messenger, networker: NetworkServices) {
        self.messenger = messenger
        self.navigator = navigator
        self.networker = networker
    }
}
