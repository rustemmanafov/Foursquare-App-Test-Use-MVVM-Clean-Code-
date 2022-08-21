//
//  FavoriteController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit

class FavoriteController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestFavoriteData {
            self.collectionView.reloadData()
        }
    }
}

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favoriteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        cell.favoriteLbl.text = viewModel.favoriteList[indexPath.row].name
        let a = viewModel.favoriteList[indexPath.row].categories.first?.icon.iconPrefix ?? ""
        let b = viewModel.favoriteList[indexPath.row].categories.first?.icon.suffix ?? ""
        let url = a + "120" + b
        cell.favoriteImg.sd_setImage(with: URL(string: url))
        cell.favoriteImg.backgroundColor = .blue
        return cell
    }
    
    
}
