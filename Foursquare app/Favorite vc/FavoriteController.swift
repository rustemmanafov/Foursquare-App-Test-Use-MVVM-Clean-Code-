//
//  FavoriteController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit
import Alamofire

class FavoriteController: UIViewController {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: Welcome?
    var list = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        requestData()
    }
    
    func requestData() {
        
        let url = "https://api.foursquare.com/v3/places/nearby?II=40.389926,49.830029"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "fsq3p2t4TjCJa5TV6tE+UXIGooHhPEEY2Kmo4kF9obgDeKA="
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(_):
                guard let responseData = response.value else { return }
                let photos = responseData.results
                
                for photo in photos {
                    self.list.append(photo)
                }
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension FavoriteController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        cell.favoriteLbl.text = list[indexPath.row].name
        let a = list[indexPath.row].categories.first?.icon.iconPrefix ?? ""
        let b = list[indexPath.row].categories.first?.icon.suffix ?? ""
        let url = a + "120" + b
        cell.favoriteImg.sd_setImage(with: URL(string: url))
        cell.favoriteImg.backgroundColor = .blue
        return cell
    }
    
    
}
