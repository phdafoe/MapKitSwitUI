//
//  MapContentInteractor.swift
//  MapKitSwiftUI
//
//  Created by Andres on 14/05/2021.
//

import Foundation

class MapContentInteractor : GenericProvider  {
            
    internal func getMapPointInteractor(success: @escaping(MapPoisResponseData) -> (), failure: @escaping(APIError) -> ()) {
        getMapProvider(success: { [weak self] (entity) in
            guard self != nil else { return }
            success(entity)
        }) { (error) in
            failure(error)
        }
    }
}
