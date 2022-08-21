//  NetworkManager.swift
//  Foursquare app
//  Created by Rustem Manafov on 18.08.22.

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethods, complete: @escaping((T) -> ())) {
        AF.request(url,
                   method: .get,
                   headers: NetworkHelper.shared.headers).responseDecodable(of: T.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                complete(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
