//
//  MapContentViewModel.swift
//  MapKitSwiftUI
//
//  Created by Andres on 14/05/2021.
//

import Foundation

class MapContentViewModel: MapContentInteractor, ObservableObject {
    
    @Published var pois: [MapPoisViewModel] = []
    
    internal func getDataFromWeb(){
        pois.removeAll()
        getMapPointInteractor(success: { [weak self] (mapPoisBusiness) in
            guard self != nil else { return }
            self?.pois = mapPoisBusiness.locationsResponseData.map { MapPoisViewModel(viewModel: $0) }
        }, failure: { (error) in
            print(error.localizedDescription)
        })
    }
}
