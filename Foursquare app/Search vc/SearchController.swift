//
//  SearchController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit
import Alamofire

class SearchController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var a: Welcome?
    var searchPlace = [Result]()
    var filteredPlace = [Result]()
    
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchData()
    }
    
    func searchData() {
        
        let url = "https://api.foursquare.com/v3/places/search"
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Authorization": "fsq3p2t4TjCJa5TV6tE+UXIGooHhPEEY2Kmo4kF9obgDeKA="
        ]
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(_):
                
                guard let responceData = response.value else {return}
                let products = responceData.results
                
                for product in products {
                    self.searchPlace.append(product)
                }
                
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
            
        }
    }

}

extension SearchController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredPlace.count
        } else if searchBar.text == "" {
            return searchPlace.count
        }
        return filteredPlace.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        if searching {
            cell.searchLabel.text = filteredPlace[indexPath.row].name
        } else {
            cell.searchLabel.text = searchPlace[indexPath.row].name
        }
        return cell
    }
}

extension SearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        filteredPlace = searchPlace.filter{ $0.name!.contains(searchText)}
        
        if searchBar.text == "" {
            searching = false
        } else {
            searching = true
        }
        self.tableView.reloadData()

    }

}

