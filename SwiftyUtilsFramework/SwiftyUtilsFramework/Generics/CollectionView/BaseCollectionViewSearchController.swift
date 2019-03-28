//
//  BaseCollectionViewSearchController.swift
//  SwiftyUtilsFramework
//
//  Created by Rashid Abbas on 27/03/2019.
//  Copyright © 2019 Rashid Abbas. All rights reserved.
//


import Foundation
import UIKit

class BaseCollectionViewSearchController<T: BaseCollectionViewCell<V>, V>: UIViewController, UISearchBarDelegate where V: Searchable {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        return cv
    }()
    private var strongDataSource: GenericCollectionViewDataSource<T, V>?
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    var models: [V] = [] {
        didSet {
            DispatchQueue.main.async {
                self.strongDataSource = GenericCollectionViewDataSource(models: self.models, configureCell: { cell, model in
                    cell.item = model
                    return cell
                })
                self.collectionView.dataSource = self.strongDataSource
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(T.self)
        //        setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        
        //        navigationItem.searchController = searchController
        //        navigationItem.hidesSearchBarWhenScrolling = false
        //        searchController.dimsBackgroundDuringPresentation = false
        //        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        strongDataSource?.search(query: searchText)
        self.collectionView.reloadData()
    }
}

