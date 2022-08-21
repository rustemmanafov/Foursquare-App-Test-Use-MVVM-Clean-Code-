//
//  FavoriteManager.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 18.08.22.
//

import Foundation

class FavoriteManager {
    
    static let shared = FavoriteManager()
    
    func getFavorite(complete: @escaping(([Result]) -> ())) {
         
        NetworkManager.shared.request(type: Welcome.self,
                                      url: NetworkHelper.shared.urlConfiguratiom(url: "/v3/places/nearby?II=40.389926,49.830029"),
                                      method: .get) { responce in
            complete(responce.results)
        }
    }
}
