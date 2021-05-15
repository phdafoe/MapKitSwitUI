//
//  BaseProvider.swift
//  MapKitSwiftUI
//
//  Created by Andres on 12/05/2021.
//

import Foundation
import Combine

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}

class BaseProvider {
    
    /// requestGeneric
    /// - Parameter entityClass: generic entity Class
    /// - Parameter endpoint: genric endpoint
    func requestGeneric<T: Decodable>(_ entityClass : T.Type, endpoint: String) -> AnyPublisher<T, APIError> {
        
        guard let url = URL(string: endpoint) else {
            preconditionFailure()
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: entityClass.self, decoder: JSONDecoder())
            .mapError { error in
                if let errorDes = error as? APIError {
                    return errorDes
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

