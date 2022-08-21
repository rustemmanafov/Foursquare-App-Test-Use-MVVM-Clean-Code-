//
//  SearchManager.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 18.08.22.
//

import Foundation

class SearchManager {
    
    static let shared = SearchManager()
    
    func getSearch(complete: @escaping(([Result]) -> ())) {
        
        NetworkManager.shared.request(type: Welcome.self,
                                      url: NetworkHelper.shared.urlConfiguratiom(url: "/v3/places/search"),
                                      method: .get) { responce in
            complete(responce.results)
        }
        
        
        
    }
}
