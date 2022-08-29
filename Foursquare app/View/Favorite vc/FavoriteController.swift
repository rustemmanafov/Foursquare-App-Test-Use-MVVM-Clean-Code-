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
    var listItem = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestFavoriteData {
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetch()
    }
    
    func fetch() {
        do {
            listItem = try context.fetch(List.fetchRequest())
            listItem.reverse()
            collectionView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        
        cell.configure(item: listItem[indexPath.row])
        
        cell.favoriteImg.backgroundColor = .brown
        return cell
    }
    
    
}
