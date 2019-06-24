//
//  ConcanViewController.swift
//  The Winner
//
//  Created by Nour  on 6/24/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class ConcanViewController: AbstractController {
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavBackButton  = true
        self.setNavBarTitle(title: "كونكان")
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
        self.tabBarController?.hidesBottomBarWhenPushed = true
        setResult()
        
        firstPlayerNameLabel.isHidden = true
        secondPlayerNameLabel.isHidden = true
        thirdPlayerNameLabel.isHidden = true
        forthPlayerNameLabel.isHidden = true
        
        if DataStore.shared.currentGame?.numberOfPlayers == 4{
            firstPlayerNameLabel.text = DataStore.shared.currentGame?.players[0].name
            secondPlayerNameLabel.text = DataStore.shared.currentGame?.players[1].name
            thirdPlayerNameLabel.text = DataStore.shared.currentGame?.players[2].name
            forthPlayerNameLabel.text =  DataStore.shared.currentGame?.players[3].name
            firstPlayerNameLabel.isHidden = false
            secondPlayerNameLabel.isHidden = false
            thirdPlayerNameLabel.isHidden = false
            forthPlayerNameLabel.isHidden = false
        }else if DataStore.shared.currentGame?.numberOfPlayers == 3{
            firstPlayerNameLabel.text = DataStore.shared.currentGame?.players[0].name
            secondPlayerNameLabel.text = DataStore.shared.currentGame?.players[1].name
            thirdPlayerNameLabel.text = DataStore.shared.currentGame?.players[2].name
            firstPlayerNameLabel.isHidden = false
            secondPlayerNameLabel.isHidden = false
            thirdPlayerNameLabel.isHidden = false
        }else if DataStore.shared.currentGame?.numberOfPlayers == 2{
            firstPlayerNameLabel.text = DataStore.shared.currentGame?.players[0].name
            secondPlayerNameLabel.text = DataStore.shared.currentGame?.players[1].name
            firstPlayerNameLabel.isHidden = false
            secondPlayerNameLabel.isHidden = false
        }
   
    }
    
    
    func setResult(){
        firstPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[0].getResult() ?? 0)"
        secondPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[1].getResult() ?? 0)"
        thirdPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[2].getResult() ?? 0)"
        forthPlayerResultLabel.text =  "\(DataStore.shared.currentGame?.players[3].getResult() ?? 0)"
    }
    
    
    
}

extension ConcanViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return laps.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LekhaCell
        if indexPath.item < laps.count{
            cell.isUserInteractionEnabled = false
            cell.lap = self.laps[indexPath.item]
            cell.alpha = 0.5
        }else{
            cell.isUserInteractionEnabled = true
            cell.alpha = 1
        }
        cell.delegate = self
        return cell
    }
}

extension ConcanViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 16, height: 95)
    }
}


extension ConcanViewController:LekhaDelegate{
    func addNewLap(firstPlayer: Int, secondPlayer: Int, thirdPlayer: Int, forthPlayer: Int) {
        
        let lap = Lap()
        lap.players = [Player(name:""),Player(name:""),Player(name:""),Player(name:"")]
        lap.players[0].result = firstPlayer
        lap.players[1].result = secondPlayer
        lap.players[2].result = thirdPlayer
        lap.players[3].result = forthPlayer
        self.laps.append(lap)
        DataStore.shared.currentGame?.players[0].setResult(res: firstPlayer)
        DataStore.shared.currentGame?.players[1].setResult(res: secondPlayer)
        DataStore.shared.currentGame?.players[2].setResult(res: thirdPlayer)
        DataStore.shared.currentGame?.players[3].setResult(res: forthPlayer)
        setResult()
        collectionView.reloadData()
    }
}
