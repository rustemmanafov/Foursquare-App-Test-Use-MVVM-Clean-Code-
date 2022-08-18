//
//  FavoriteCollectionViewCell.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteLbl: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        favoriteImage.layer.cornerRadius = 15
    }
}
