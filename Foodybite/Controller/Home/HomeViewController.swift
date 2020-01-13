//
//  HomeViewController.swift
//  Foodybite
//
//  Created by Usama Sadiq on 1/10/20.
//  Copyright © 2020 Usama Sadiq. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let restaurants  = [ #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage"), #imageLiteral(resourceName: "RestaurantImage") ]
    let categories  = [ #imageLiteral(resourceName: "DummyCategoryImage1"), #imageLiteral(resourceName: "DummyCategoryImage2"), #imageLiteral(resourceName: "DummyCategoryImage3"), #imageLiteral(resourceName: "DummyCategoryImage1"), #imageLiteral(resourceName: "DummyCategoryImage2"), #imageLiteral(resourceName: "DummyCategoryImage3")]
    let friends  = [ #imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage"),#imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage") , #imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage"),#imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage") , #imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage"),#imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage") , #imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage"),#imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage") , #imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage"),#imageLiteral(resourceName: "dummyFriendsImage"), #imageLiteral(resourceName: "dummyFriendsImage") ]
    
    @IBOutlet weak var tendingCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    
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
        if collectionView == tendingCollectionView {
            totalTrendingRestaurents.text = "See All(\(restaurants.count))"
            return restaurants.count
        }
        if collectionView == categoryCollectionView {
            totalCategories.text = "See All(\(categories.count))"
            return categories.count
        }
        
        totalFriends.text = "See All(\(friends.count))"
        return friends.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tendingCollectionView {
            
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! TrendingCollectionViewCell
            cell.restaurantOrFoodImage.image = restaurants[indexPath.row]
            cell.distance.text = "\(indexPath.row) km"
            cell.restaurantName.text = "Dummy - \(indexPath.row)"
            return cell
        }
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
            cell.categoryImage.image = categories[indexPath.row]
            cell.categoryLabel.text = "Item-\(indexPath.row)"
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsCell", for: indexPath) as! FriendsCollectionViewCell
        
        cell.friendImage.image = friends[indexPath.row]
        return cell
        
    }
  
    
    
}
