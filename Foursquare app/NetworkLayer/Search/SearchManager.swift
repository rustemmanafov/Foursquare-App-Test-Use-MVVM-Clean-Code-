//
//  SearchManager.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 18.08.22.
//

import Foundation
import Alamofire

class SearchManager {
    
    static let shared = SearchManager()
    
    func getPhotos(complete: @escaping(([Result]) -> ())) {
        
        NetworkManager.shared.request(type: [Result].self,
                                      url: NetworkHelper.shared.urlConfiguratiom(url: "/v3/places/search"),
                                      method: .get,
                                      header: NetworkHelper.shared.headers) { responce in
            complete(responce)
        }
        
        
        
    }
}
