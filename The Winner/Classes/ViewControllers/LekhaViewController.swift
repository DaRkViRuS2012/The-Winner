//
//  LekhaViewController.swift
//  The Winner
//
//  Created by Nour  on 6/24/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class LekhaViewController: AbstractController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var firstPlayerNameLabel:UILabel!
    @IBOutlet weak var secondPlayerNameLabel:UILabel!
    @IBOutlet weak var thirdPlayerNameLabel:UILabel!
    @IBOutlet weak var forthPlayerNameLabel:UILabel!
    @IBOutlet weak var firstPlayerResultLabel:UILabel!
    @IBOutlet weak var secondPlayerResultLabel:UILabel!
    @IBOutlet weak var thirdPlayerResultLabel:UILabel!
    @IBOutlet weak var forthPlayerResultLabel:UILabel!
    
    
    var laps:[Lap] = []
    let cellId = "LekhaCell"
    let footerCell = "FooterCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavBackButton  = true
        self.setNavBarTitle(title: "ليخا")
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
        collectionView.register(UINib(nibName: footerCell, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier:footerCell)
        self.tabBarController?.hidesBottomBarWhenPushed = true
        setResult()
        firstPlayerNameLabel.text = DataStore.shared.currentGame?.players[0].name
        secondPlayerNameLabel.text = DataStore.shared.currentGame?.players[1].name
        thirdPlayerNameLabel.text = DataStore.shared.currentGame?.players[2].name
        forthPlayerNameLabel.text =  DataStore.shared.currentGame?.players[3].name
        
        self.hideTabBar()
    }
    
    override func backButtonAction(_ sender: AnyObject) {
        let alert = UIAlertController(title: "خروج؟", message: "لن تستطيع مشاهدة النتائج مرة اخرى", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "حسنا", style: .default) { (_) in
            self.tabBarController?.tabBar.isHidden = false
            self.popOrDismissViewControllerAnimated(animated: true)
        }
        let cancelAction = UIAlertAction(title: "الغاء", style: .cancel) { (_) in
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setResult(){
        firstPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[0].getResult() ?? 0)"
        secondPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[1].getResult() ?? 0)"
        thirdPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[2].getResult() ?? 0)"
        forthPlayerResultLabel.text =  "\(DataStore.shared.currentGame?.players[3].getResult() ?? 0)"
    }
    
    
    
}

extension LekhaViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return laps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LekhaCell
        cell.lap = self.laps[indexPath.item]
        cell.delegate = self
        return cell
    }
}

extension LekhaViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 16, height: 95)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
    
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerCell, for: indexPath) as! FooterCell
            
            footerView.delegate = self
            return footerView
            
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width - 16, height: 95)
    }
}


extension LekhaViewController:LekhaDelegate{
    func addNewLap(firstPlayer: Int, secondPlayer: Int, thirdPlayer: Int, forthPlayer: Int) {
        
        let lap = Lap()
        lap.players = [Player(name:""),Player(name:""),Player(name:""),Player(name:"")]
        lap.players[0].result = firstPlayer
        lap.players[1].result = secondPlayer
        lap.players[2].result = thirdPlayer
        lap.players[3].result = forthPlayer
        
        DataStore.shared.currentGame?.players[0].setResult(res: firstPlayer)
        DataStore.shared.currentGame?.players[1].setResult(res: secondPlayer)
        DataStore.shared.currentGame?.players[2].setResult(res: thirdPlayer)
        DataStore.shared.currentGame?.players[3].setResult(res: forthPlayer)
        setResult()
        self.collectionView.performBatchUpdates({
            let indexPath = IndexPath(row: self.laps.count, section: 0)
            self.laps.append(lap) //add your object to data source first
            self.collectionView.insertItems(at: [indexPath])
        }, completion: nil)
    }
}
