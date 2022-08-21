//
//  HomeController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit
import SDWebImage

class HomeController: UIViewController, ListCollectionViewCellDelegate {
    
    let context = AppDelegate().persistentContainer.viewContext
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    var listItems = [List]()
    
    var viewModel = ModelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        viewModel.requestData {
        //            self.favoriteCollectionView.reloadData()
        //        }
        viewModel.requestData {
            self.listCollectionView.reloadData()
        }
    }
    
    func navigate(index: Int) {
        print("Worked")
        
        func fetch() {
            do {
                listItems = try context.fetch(List.fetchRequest())
                listItems.reverse()
                favoriteCollectionView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
        
        func save(title: String) {
            let model = List(context: context)
            model.title = title
            do {
                try context.save()
                fetch()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == favoriteCollectionView {
            return viewModel.list.count
        } else  {
            return viewModel.list.count
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
            listCell.listLbl.text = viewModel.list[indexPath.row].name
            
            let a = viewModel.list[indexPath.row].categories.first?.icon.iconPrefix ?? ""
            let b = viewModel.list[indexPath.row].categories.first?.icon.suffix ?? ""
            let url = a + "120" + b
            listCell.listImage.sd_setImage(with: URL(string: url))
            listCell.listImage.backgroundColor = .blue
            
            listCell.delegate = self
            listCell.tag = indexPath.row
            
            return listCell
        }
        
    }
    
    func addToFavorite(index: Int) {
        navigate(index: index)
    }
    
}

