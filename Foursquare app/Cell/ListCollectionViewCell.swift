//
//  ListCollectionViewCell.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var listLbl: UILabel!
    @IBOutlet weak var listImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        listImage.layer.cornerRadius = 15
    }
}
