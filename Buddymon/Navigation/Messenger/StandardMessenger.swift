//
//  StandardMessenger.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 08/01/22.
//

import Foundation
import UIKit

public final class StandardMessenger: Messenger {
    public lazy var loader: Loadable = ActivityLoader()
    public lazy var alert: AlertMessage = SystemAlertMessenger()
    
    public init() {}
}


