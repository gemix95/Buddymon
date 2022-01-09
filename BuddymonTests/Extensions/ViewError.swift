//
//  ViewError.swift
//  BuddymonTests
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation

public enum ViewError: Error {
    /// A view cannot be found using the identifier
    case identifierNotFound(String)
    /// A matching view type cannot be found
    case typeNotFound(String)

    var localizedDescription: String {
        switch self {
        case .identifierNotFound(let identifier):
            return "Could not find view with identifier: '\(identifier)'"
        case .typeNotFound(let type):
            return "Could not find any views of type: `\(type)`"
        }
    }
}
