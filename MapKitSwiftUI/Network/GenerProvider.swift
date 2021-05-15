//
//  GenerProvider.swift
//  MapKitSwiftUI
//
//  Created by Andres on 12/05/2021.
//

import Foundation
import Combine

class GenericProvider: BaseProvider {
    
    var cancellable: Set<AnyCancellable> = []
    
    func getMapProvider(success: @escaping(MapPoisResponseData) -> (), failure: @escaping(APIError) -> ()) {
        requestGeneric(MapPoisResponseData.self, endpoint: CONSTANTS.BASE_URL.BASE_HEROKU+CONSTANTS.BASE_URL.ICOLOCATIONS)
            .sink(receiveCompletion: { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    failure(error)
                }
            }) { (data) in
                success(data)
            }.store(in: &cancellable)
    }
}
