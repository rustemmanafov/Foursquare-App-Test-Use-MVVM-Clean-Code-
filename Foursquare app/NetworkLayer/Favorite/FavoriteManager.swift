//
//  FavoriteManager.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 18.08.22.
//

import Foundation
import Alamofire

class FavoriteManager {
    
    static let shared = FavoriteManager()
    
    func getPhotos(complete: @escaping(([Result]) -> ())) {
         
        NetworkManager.shared.request(type: [Result].self,
                                      url: NetworkHelper.shared.urlConfiguratiom(url: "/v3/places/nearby?II=40.389926,49.830029"),
                                      method: .get,
                                      header: NetworkHelper.shared.headers) { responce in
            complete(responce)
        }
        
        
        
    }
}
