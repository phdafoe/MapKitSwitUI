//
//  MapPoisResponseData.swift
//  MapKitSwiftUI
//
//  Created by Andres on 14/05/2021.
//

import Foundation

// MARK: - MapPois
struct MapPoisResponseData: Decodable {
    let locationsResponseData: [LocationsResponseDatum]
}

// MARK: - LocationsResponseDatum
struct LocationsResponseDatum: Decodable, Identifiable {
    let id: Int
    let descriptionInfo, name: String
    let cityImage: String
    let latitude, longitude: Double
}
