//
//  HomeViewController.swift
//  Foodybite
//
//  Created by Usama Sadiq on 1/10/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let array  = [ #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage") ]
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var totalTrendingRestaurents: UILabel!
    @IBOutlet weak var totalCategories: UILabel!
    //category collection view link
    @IBOutlet weak var totalFriends: UILabel!
    //friends collectionview link
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func filterButton(_ sender: Any) {
    }


}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrototypeCollectionViewCell", for: indexPath) as! TrendingCollectionViewCell
        return cell
    }
    
    
}
