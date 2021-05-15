//
//  RemoteImageUrl.swift
//  MapKitSwiftUI
//
//  Created by Andres on 12/05/2021.
//


import Foundation
import UIKit

class RemoteImageUrl: ObservableObject {
    
    @Published var data = Data()
    
    internal func getImageFromUrl(_ imageUrl : String){
        guard let url = URL(string: imageUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
