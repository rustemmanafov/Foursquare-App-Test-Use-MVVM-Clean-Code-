//
//  ModelView.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 18.08.22.
//

import UIKit
import Alamofire

class ModelView {
    
    var data: Welcome?
    var list = [Result]()
    var fsq_id = 0
    var id = 0
    
    var listData: Result?
    var imageData = [Category]()
    
    func requestData(complete: @escaping(() -> ())) {
        
        let url = "https://api.foursquare.com/v3/places/nearby?II=40.389926,49.830029"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "fsq3p2t4TjCJa5TV6tE+UXIGooHhPEEY2Kmo4kF9obgDeKA="
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(_):
                guard let responseData = response.value else { return }
                let photos = responseData.results
                
                for photo in photos {
                    self.list.append(photo)
                    complete()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func requestDataById(complete: @escaping(() -> ())) {
        
        let url = "https://api.foursquare.com/v3/places/5a187743ccad6b307315e6fe"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "fsq3p2t4TjCJa5TV6tE+UXIGooHhPEEY2Kmo4kF9obgDeKA="
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: Result.self) { response in
            switch response.result {
            case .success(_):
                guard let responseData = response.value else { return }
                let photos = responseData.categories
                
                for photo in photos {
                    self.imageData.append(photo)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
