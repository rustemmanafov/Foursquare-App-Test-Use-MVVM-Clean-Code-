//
//  ModelView.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 18.08.22.
//

import UIKit

class ModelView {
    
    // Home vc
    var data: Welcome?
    var list = [Result]()
    
    // Add favorite in home vc
    var listData: Place?
    var place: Place?
    
    // Search vc
    var searchPlace = [Result]()
    var filteredPlace = [Result]()
    
    // Favorite vc
    var favoriteList = [Result]()
    var favoriteData: Welcome?
    
    func requestData(complete: @escaping(() -> ())) {
        HomeManager.shared.getPhotos { items in
            self.list = items
            complete()
        }
    }
    
    func requestSearchData(complete: @escaping(() -> ())) {
        SearchManager.shared.getSearch { items in
            self.searchPlace = items
            complete()
        }
    }
    
    func requestFavoriteData(complete: @escaping(() -> ())) {
        FavoriteManager.shared.getFavorite { items in
            self.favoriteList = items
            complete()
        }
    }
    
    
}
