//
//  ListCollectionViewCell.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit

protocol ListCollectionViewCellDelegate {
    func addToFavorite(index: Int)
}

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var listLbl: UILabel!
    @IBOutlet weak var listImage: UIImageView!
    
    var delegate: ListCollectionViewCellDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()

        listImage.layer.cornerRadius = 15
    }
    
    @IBAction func addToFavorit(_ sender: Any) {
        delegate?.addToFavorite(index: tag)
    }
}
