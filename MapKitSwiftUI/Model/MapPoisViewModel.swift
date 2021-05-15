//
//  MapPoisViewModel.swift
//  MapKitSwiftUI
//
//  Created by Andres on 14/05/2021.
//

import Foundation

// MARK: - MapPois
struct MapPoisViewModel: Decodable, Identifiable {
    let id: Int?
    let name: String?
    let cityImage: String?
    let latitude, longitude: Double?
    
    
    init(viewModel: LocationsResponseDatum) {
        self.id = viewModel.id
        self.name = viewModel.name
        self.cityImage = viewModel.cityImage
        self.latitude = viewModel.latitude
        self.longitude = viewModel.longitude
    }
}


