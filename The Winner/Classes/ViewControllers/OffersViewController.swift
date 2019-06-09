//
//  OffersViewController.swift
//  The Winner
//
//  Created by Nour  on 5/25/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class OffersViewController: AbstractController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var noResultView: UIView!
    
    var offers:[Offer] = []
    var cellId = "OfferCell"
    
    var res_id:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavBarTitle(title:"العروض")
        
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
        self.showNavBackButton = true
        self.showNavAboutAndOffersButton = true
        if let id = res_id{
            getOffers(id)
        }else{
            getAllOffers()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    func getOffers(_ id:String){
        
        self.showActivityLoader(true)
        ApiManager.shared.getOffersBy(id: id) { (success, error, result) in
            
            self.showActivityLoader(false)
            if success{
                self.offers = result
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
        }
        
    }
    
    func getAllOffers(){
        
        self.showActivityLoader(true)
        ApiManager.shared.getoffers { (success, error, result) in
            
            self.showActivityLoader(false)
            if success{
                self.offers = result
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
        }
        
    }
    
    
    
    
}

extension OffersViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! OfferCell
        cell.offer = offers[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = offers[indexPath.item].description ?? ""
        self.showMessage(message: title, type: .success)
        
    }
}


extension OffersViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = self.view.bounds.width  - 16
        let height:CGFloat = 350.0
        return CGSize(width: width, height: height)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 10
    //    }
}
