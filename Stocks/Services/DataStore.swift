//
//  DataStore.swift
//  Stocks
//
//  Created by Logan Blevins on 6/16/24.
//

import Foundation
import Combine

protocol DataStore {
    func fetchPortfolio() -> AnyPublisher<[Stock], Error>
}

enum DataStoreError: LocalizedError {
    case badUrl(String)
    case transport(Int)
    case unknown

    var errorDescription: String? {
        switch self {
        case .badUrl(let url):
            return L10n.DataStoreError.badUrl(url)
        case .transport(let reason):
            return L10n.DataStoreError.transport(reason)
        case .unknown:
            return L10n.DataStoreError.unknown
        }
    }
}
