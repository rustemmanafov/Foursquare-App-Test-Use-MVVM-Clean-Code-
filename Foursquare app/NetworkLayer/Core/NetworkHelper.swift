//
//  NetworkHelper.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 20.08.22.
//

import Foundation
import Alamofire

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    private let baseUrl = "https://api.foursquare.com"
    
    let headers: HTTPHeaders = [
        "Accept": "application/json",
        "Authorization": "fsq3p2t4TjCJa5TV6tE+UXIGooHhPEEY2Kmo4kF9obgDeKA="
    ]
    
    func urlConfiguratiom(url: String) -> String {
        baseUrl + url
    }
}
