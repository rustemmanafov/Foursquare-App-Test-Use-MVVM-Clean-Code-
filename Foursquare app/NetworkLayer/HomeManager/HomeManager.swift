//  HomeManager.swift
//  Foursquare app
//  Created by Rustem Manafov on 19.08.22.

import Foundation
import Alamofire

class HomeManager {
    
    static let shared = HomeManager()
    
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
