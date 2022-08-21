//  HomeManager.swift
//  Foursquare app
//  Created by Rustem Manafov on 19.08.22.

import Foundation

class HomeManager {
    
    static let shared = HomeManager()
    
    func getPhotos(complete: @escaping(([Result]) -> ())) {
        
        NetworkManager.shared.request(type: Welcome.self,
                                      url: NetworkHelper.shared.urlConfiguratiom(url: "/v3/places/nearby?II=40.389926,49.830029"),
                                      method: .get) { response in
            
            complete(response.results)
        }
    }
    
}
