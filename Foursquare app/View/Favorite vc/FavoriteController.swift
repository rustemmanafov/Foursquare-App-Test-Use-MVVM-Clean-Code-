//
//  FavoriteController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit

class FavoriteController: UIViewController {
    
    let context = AppDelegate().persistentContainer.viewContext
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ModelView()
    var listItems = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestFavoriteData {
            self.collectionView.reloadData()
        }
     //   fetch()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetch()
    }
    
    func fetch() {
        do {
            listItems = try context.fetch(List.fetchRequest())
            listItems.reverse()
            collectionView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        cell.favoriteLbl.text = listItems[indexPath.row].title
        cell.favoriteImg.image = UIImage(named: listItems[indexPath.row].photo)
        
//        let a = viewModel.listItems[indexPath.row].categories.first?.icon.iconPrefix ?? ""
//        let b = viewModel.listItems[indexPath.row].categories.first?.icon.suffix ?? ""
//        let url = a + "120" + b
//        cell.favoriteImg.sd_setImage(with: URL(string: url))
        cell.favoriteImg.backgroundColor = .blue
        return cell
    }
    
    
}
