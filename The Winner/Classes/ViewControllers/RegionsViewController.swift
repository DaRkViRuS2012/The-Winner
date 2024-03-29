//
//  RegionsViewController.swift
//  The Winner
//
//  Created by Nour  on 5/25/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class RegionsViewController: AbstractController {

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var noResultView: UIView!
    
    var regions:[City] = []
    var cellId = "RegionCell"
    
    var city_id:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavBarTitle(title: "يرجى اختيار المنطقة")
        
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
        self.showNavBackButton = true
        self.showNavAboutAndOffersButton = true
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getRegions()
    }
    
    func getRegions(){
        
        self.showActivityLoader(true)
        ApiManager.shared.getRegions(city_id: city_id ?? "", completionBlock: { (success, error, result) in
            self.showActivityLoader(false)
            if success{
                self.regions = result
                if result.count == 0 {
                    self.noResultView.isHidden = false
                }else{
                    self.noResultView.isHidden = true
                }
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

extension RegionsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return regions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! RegionCell
        cell.region = regions[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "RestaurantsViewController" ) as! RestaurantsViewController
        vc.city_id = regions[indexPath.item].cID
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension RegionsViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = (self.view.bounds.width / 2 ) - 16
        let height:CGFloat = 200.0
        return CGSize(width: width, height: height)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 10
    //    }
}
