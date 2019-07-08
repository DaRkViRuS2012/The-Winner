//
//  Tarneeb41Cell.swift
//  The Winner
//
//  Created by Nour  on 6/18/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

protocol Tarneeb41Delegate {
    func addNewLap(firstPlayer:Int,secondPlayer:Int,thirdPlayer:Int,forthPlayer:Int)
}

class Tarneeb41Cell: UICollectionViewCell {

    @IBOutlet weak var firstPlayerTF: UILabel!
    @IBOutlet weak var secondPlayerTF: UILabel!
    @IBOutlet weak var thirdPlayerTF: UILabel!
    @IBOutlet weak var forthPlayerTF: UILabel!
    @IBOutlet weak var firstPlayerLabel: UILabel!
    @IBOutlet weak var secondPlayerLabel: UILabel!
    @IBOutlet weak var thirdPlayerLabel: UILabel!
    @IBOutlet weak var forthPlayerLabel: UILabel!
    
    var delegate:Tarneeb41Delegate?
    
    var lap :Lap?{
        didSet{
            guard let lap = lap else {return}
            
            self.firstPlayerTF.text = "\(lap.players[0].getResult() )"
            self.firstPlayerTF.isEnabled = false
        
            self.secondPlayerTF.text = "\(lap.players[1].getResult() )"
            self.secondPlayerTF.isEnabled = false

            if let type = DataStore.shared.currentGame?.type,type == .tarneb41{
                self.thirdPlayerTF.text = "\(lap.players[2].getResult() )"
                self.thirdPlayerTF.isEnabled = false
                self.forthPlayerTF.text = "\(lap.players[3].getResult() )"
                self.forthPlayerTF.isEnabled = false
                thirdPlayerTF.isHidden = false
                forthPlayerTF.isHidden = false
            }else{
                thirdPlayerTF.isHidden = true
                forthPlayerTF.isHidden = true
                thirdPlayerLabel.isHidden = true
                forthPlayerLabel.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if let type = DataStore.shared.currentGame?.type,type == .tarneb41{
            thirdPlayerTF.isHidden = false
            forthPlayerTF.isHidden = false
        }else{
            thirdPlayerTF.isHidden = true
            forthPlayerTF.isHidden = true
            thirdPlayerLabel.isHidden = true
            forthPlayerLabel.isHidden = true
        }
    }

    @IBAction func addNew(_ sender: UIButton) {
           delegate?.addNewLap(firstPlayer: 0, secondPlayer: 0, thirdPlayer: 0, forthPlayer: 0)
//        if let type = DataStore.shared.currentGame?.type,type == .tarneb41{
//            if let fResult = firstPlayerTF.text,let sResult = secondPlayerTF.text,let tResult = thirdPlayerTF.text , let ftResult = forthPlayerTF.text , !fResult.isEmpty,!sResult.isEmpty,!tResult.isEmpty,!fResult.isEmpty , let fIntResutl = Int(fResult),let sIntResutl = Int(sResult),let tIntResutl = Int(tResult),let ftIntResutl = Int(ftResult){
//                delegate?.addNewLap(firstPlayer: fIntResutl, secondPlayer: sIntResutl, thirdPlayer: tIntResutl, forthPlayer: ftIntResutl)
//                firstPlayerTF.text = nil
//                secondPlayerTF.text = nil
//                thirdPlayerTF.text = nil
//                forthPlayerTF.text = nil
//            }else{
//                (UIApplication.visibleViewController() as! AbstractController).showMessage(message: "الرجاء ادخال النتائج", type: .warning)
//            }
//        }else if let type = DataStore.shared.currentGame?.type,type == .tarneb61{
//            if let fResult = firstPlayerTF.text,let sResult = secondPlayerTF.text, !fResult.isEmpty,!sResult.isEmpty, let fIntResutl = Int(fResult),let sIntResutl = Int(sResult){
//                delegate?.addNewLap(firstPlayer: fIntResutl, secondPlayer: sIntResutl, thirdPlayer: 0, forthPlayer: 0)
//                firstPlayerTF.text = nil
//                secondPlayerTF.text = nil
//                thirdPlayerTF.text = nil
//                forthPlayerTF.text = nil
//            }else{
//                (UIApplication.visibleViewController() as! AbstractController).showMessage(message: "الرجاء ادخال النتائج", type: .warning)
//            }
//        }
    }
}
