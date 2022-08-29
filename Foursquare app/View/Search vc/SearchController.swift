//
//  SearchController.swift
//  Foursquare app
//
//  Created by Rustem Manafov on 13.08.22.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ModelView()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestSearchData {
            self.tableView.reloadData()
        }
    }
}

extension SearchController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return viewModel.filteredPlace.count
        } else if searchBar.text == "" {
            return viewModel.searchPlace.count
        }
        return viewModel.filteredPlace.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        if searching {
            cell.searchLabel.text = viewModel.filteredPlace[indexPath.row].name
        } else {
            cell.searchLabel.text = viewModel.searchPlace[indexPath.row].name
        }
        return cell
    }
}

extension SearchController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.filteredPlace = viewModel.searchPlace.filter{ $0.name!.contains(searchText)}
        
        if searchBar.text == "" {
            searching = false
        } else {
            searching = true
        }
        self.tableView.reloadData()
        
    }
    
}

//extension SearchController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        viewModel.searchArticles(text: searchBar.text ?? "")
//    }
//}


