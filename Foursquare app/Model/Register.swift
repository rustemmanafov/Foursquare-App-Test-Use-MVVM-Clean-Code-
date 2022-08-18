//
//  Register.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import Foundation

struct Register: Codable {
    let firstName: String?
    let lastName: String?
    let email: String?
    let password: String?
    let gender: String?
    let birthday: String?
}
