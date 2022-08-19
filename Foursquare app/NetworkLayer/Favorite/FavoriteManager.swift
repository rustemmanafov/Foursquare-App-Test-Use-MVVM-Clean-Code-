//
//  FavoriteManager.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 18.08.22.
//

import Foundation

class FavoriteManager {
    
    static let shared = FavoriteManager()
    
    func getPhotos(complete: @escaping(([Result]) -> ())) {
        
        let url = "https://api.foursquare.com/v3/places/nearby?II=40.389926,49.830029"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "fsq3p2t4TjCJa5TV6tE+UXIGooHhPEEY2Kmo4kF9obgDeKA="
        ]
        
        NetworkManager.shared.request(type: [Result].self,
                                      url: url,
                                      method: .get) { responce in
            complete(responce)
        }
        
        
        
    }
}
