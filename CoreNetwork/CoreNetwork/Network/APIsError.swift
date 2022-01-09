//
//  APIsError.swift
//  Buddymon
//
//  Created by Emmanuele Corporente on 09/01/22.
//

import Foundation

public enum APIsError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode
    case badUrl
    case generic(String?)
    
    public var localized: String {
        switch self {
        case .generic(let message):
            return message ?? "Generic error, try again later."
        case .networkError(let error):
            return error.localizedDescription
        case .dataNotFound:
            return "No data available"
        case .invalidStatusCode:
            return "Invalid status code"
        case .badUrl:
            return "Bad url"
        case .jsonParsingError(let error):
            return error.localizedDescription
        }
    }
}
