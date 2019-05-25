//
//  CountriesViewController.swift
//  The Winner
//
//  Created by Nour  on 5/25/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class CountriesViewController: AbstractController {

    @IBOutlet weak var collectionView:UICollectionView!
    
    var cities:[City] = []
    var cellId = "CityCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavBarTitle(title: "يرجى اختيار المحافظة")
        
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
        
        getCities()
    }
    
    func getCities(){
        
        self.showActivityLoader(true)
        ApiManager.shared.getCountries { (success, error, result) in
            self.showActivityLoader(false)
            if success{
                self.cities = result
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

extension CountriesViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CityCell
        cell.city = cities[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "RegionsViewController" ) as! RegionsViewController
        vc.city_id = cities[indexPath.item].cID
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension CountriesViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = (self.view.bounds.width / 2 ) - 16
        let height:CGFloat = 200.0
        return CGSize(width: width, height: height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
}
