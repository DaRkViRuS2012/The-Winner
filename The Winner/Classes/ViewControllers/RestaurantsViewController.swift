//
//  RestaurantsViewController.swift
//  The Winner
//
//  Created by Nour  on 5/25/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class RestaurantsViewController: AbstractController {

    @IBOutlet weak var collectionView:UICollectionView!
    
    var restaurants:[Restaurant] = []
    var cellId = "RestaurantCell"
    
    var city_id:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavBarTitle(title: "المطاعم")
        
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
        self.showNavBackButton = true
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRegions()
    }
    
    
    func getRegions(){
        
        self.showActivityLoader(true)
        ApiManager.shared.getRestaurants(city_id: city_id ?? "", completionBlock: { (success, error, result) in
            self.showActivityLoader(false)
            if success{
                self.restaurants = result
                self.collectionView.reloadData()
            }
            if error != nil{
                if let msg = error?.errorName{
                    self.showMessage(message: msg, type: .error)
                }
            }
        })
        
    }
    
    
}

extension RestaurantsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RestaurantCell
        cell.restaurant = restaurants[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


extension RestaurantsViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = self.view.bounds.width  - 16
        let height:CGFloat = 350.0
        return CGSize(width: width, height: height)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 10
    //    }
}
