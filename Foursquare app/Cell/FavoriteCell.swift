//
//  FavoriteCell.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 18.08.22.
//

import UIKit
import SDWebImage

protocol FavoriteProtocol {
    var text: String  { get }
    var photo: String { get }
}

class FavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteLbl: UILabel!
    @IBOutlet weak var favoriteImg: UIImageView!
    
    func configure(item: FavoriteProtocol) {
        favoriteLbl.text = item.text
        favoriteImg.sd_setImage(with: URL(string: item.photo))

    }
    
}


