//
//  HomeController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit
import Alamofire
import SDWebImage

class HomeController: UIViewController {
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    var viewModel = ModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestData {
            DispatchQueue.main.async {
                self.favoriteCollectionView.reloadData()
            }
        }
//        viewModel.requestDataById {
//            DispatchQueue.main.async {
//                self.listCollectionView.reloadData()
//            }
//        }
    
    }
    
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == favoriteCollectionView {
            return viewModel.list.count
        } else  {
            return viewModel.imageData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == favoriteCollectionView {
            let favoriteCell = favoriteCollectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCollectionViewCell", for: indexPath) as! FavoriteCollectionViewCell
            favoriteCell.favoriteLbl.text = viewModel.list[indexPath.row].name
            
            let a = viewModel.list[indexPath.row].categories.first?.icon.iconPrefix ?? ""
            let b = viewModel.list[indexPath.row].categories.first?.icon.suffix ?? ""
            let url = a + "120" + b
            favoriteCell.favoriteImage.sd_setImage(with: URL(string: url))
            favoriteCell.favoriteImage.backgroundColor = .blue
            
            return favoriteCell
        } else {
            let listCell = listCollectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
            listCell.listLbl.text = viewModel.imageData[indexPath.row].name
            listCell.listImage.backgroundColor = .red
            
            return listCell
        }
        
    }
    
}

