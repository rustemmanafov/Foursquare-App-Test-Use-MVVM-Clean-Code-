//
//  FavoriteCollectionViewCell.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit
import SDWebImage

protocol FavoriteCellProtocol {
    var text: String  { get }
    var photo: String { get }
}

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteLbl: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteImage.layer.cornerRadius = 15
    }
    
    func configure(item: FavoriteCellProtocol) {
        favoriteLbl.text = item.text
        favoriteImage.sd_setImage(with: URL(string: item.photo))

    }
}


