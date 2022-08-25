//
//  List+CoreDataClass.swift
//  
//
//  Created by Rustem Manafov on 20.08.22.
//
//

import Foundation
import CoreData

@objc(List)
public class List: NSManagedObject, FavoriteCellProtocol {
    var text: String {
        title ?? ""
    }
    
    var photo: String {
        image ?? ""
    }
}
