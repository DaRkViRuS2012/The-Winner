//
//  LekhaCell.swift
//  The Winner
//
//  Created by Nour  on 6/24/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

protocol LekhaDelegate {
    func addNewLap(firstPlayer:Int,secondPlayer:Int,thirdPlayer:Int,forthPlayer:Int)
}

class LekhaCell: UICollectionViewCell {
    @IBOutlet weak var firstPlayerTF: XUITextField!
    @IBOutlet weak var secondPlayerTF: XUITextField!
    @IBOutlet weak var thirdPlayerTF: XUITextField!
    @IBOutlet weak var forthPlayerTF: XUITextField!
    
    @IBOutlet weak var forthPlayerNameLabel: UILabel!
    @IBOutlet weak var thirdPlayerNameLabel: UILabel!
    @IBOutlet weak var secondPlayerNameLabel: UILabel!
    @IBOutlet weak var firstPlayerNameLabel: UILabel!
    
    var delegate:LekhaDelegate?
    
    var lap :Lap?{
        didSet{
            guard let lap = lap else {return}
            
            self.firstPlayerTF.text = "\(lap.players[0].getResult())"
            self.firstPlayerTF.isEnabled = false
            
            self.secondPlayerTF.text = "\(lap.players[1].getResult())"
            self.secondPlayerTF.isEnabled = false
            if DataStore.shared.currentGame!.numberOfPlayers > 2{
                self.thirdPlayerTF.text = "\(lap.players[2].getResult())"
                self.thirdPlayerTF.isEnabled = false
                if DataStore.shared.currentGame!.numberOfPlayers > 3{
                    self.forthPlayerTF.text = "\(lap.players[3].getResult())"
                    self.forthPlayerTF.isEnabled = false
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if DataStore.shared.currentGame?.numberOfPlayers == 4{
            firstPlayerTF.isHidden = false
            secondPlayerTF.isHidden = false
            thirdPlayerTF.isHidden = false
            forthPlayerTF.isHidden = false
            
            forthPlayerNameLabel.isHidden = false
            thirdPlayerNameLabel.isHidden = false
            secondPlayerNameLabel.isHidden = false
            firstPlayerNameLabel.isHidden = false
        }else if DataStore.shared.currentGame?.numberOfPlayers == 3{
            firstPlayerTF.isHidden = false
            secondPlayerTF.isHidden = false
            thirdPlayerTF.isHidden = false
            forthPlayerTF.isHidden = true
            forthPlayerNameLabel.isHidden = false
            thirdPlayerNameLabel.isHidden = false
            secondPlayerNameLabel.isHidden = false
            firstPlayerNameLabel.isHidden = true
            forthPlayerTF.text = "0"
            
        }else if DataStore.shared.currentGame?.numberOfPlayers == 2{
            firstPlayerTF.isHidden = false
            secondPlayerTF.isHidden = false
            thirdPlayerTF.isHidden = true
            forthPlayerTF.isHidden = true
            forthPlayerNameLabel.isHidden = false
            thirdPlayerNameLabel.isHidden = false
            secondPlayerNameLabel.isHidden = true
            firstPlayerNameLabel.isHidden = true
            thirdPlayerTF.text = "0"
            forthPlayerTF.text = "0"
            
        }
        
        
    }
    
    @IBAction func addNew(_ sender: UIButton) {
        if let fResult = firstPlayerTF.text,let sResult = secondPlayerTF.text,let tResult = thirdPlayerTF.text , let ftResult = forthPlayerTF.text , !fResult.isEmpty,!sResult.isEmpty,!tResult.isEmpty,!fResult.isEmpty , let fIntResutl = Int(fResult),let sIntResutl = Int(sResult),let tIntResutl = Int(tResult),let ftIntResutl = Int(ftResult){
            delegate?.addNewLap(firstPlayer: fIntResutl, secondPlayer: sIntResutl, thirdPlayer: tIntResutl, forthPlayer: ftIntResutl)
            firstPlayerTF.text = nil
            secondPlayerTF.text = nil
            thirdPlayerTF.text = nil
            forthPlayerTF.text = nil
        }else{
            (UIApplication.visibleViewController() as! AbstractController).showMessage(message: "الرجاء ادخال النتائج", type: .warning)
        }
    }
}
