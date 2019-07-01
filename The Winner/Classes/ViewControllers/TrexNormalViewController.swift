//
//  TrexNormalViewController.swift
//  The Winner
//
//  Created by Nour  on 6/29/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class TrexNormalViewController: AbstractController {

    // first Lap
    @IBOutlet weak var lap1SPLabel: UILabel!
    @IBOutlet weak var lap1FPLabel: UILabel!
    @IBOutlet weak var lap1TPLabel: UILabel!
    @IBOutlet weak var lap1FTPLabel: UILabel!
    
    @IBOutlet weak var lap1FPResultLabel: UILabel!
    @IBOutlet weak var lap1SPResultLabel: UILabel!
    @IBOutlet weak var lap1TPResultLabel: UILabel!
    @IBOutlet weak var lap1FTPResultLabel: UILabel!
    
    @IBOutlet weak var lap1FPTrexTF: XUITextField!
    @IBOutlet weak var lap1FPBanatTF: XUITextField!
    @IBOutlet weak var lap1FPDenariTF: XUITextField!
    @IBOutlet weak var lap1FPLatshTF: XUITextField!
    @IBOutlet weak var lap1FPKhetiarTF: XUITextField!
    @IBOutlet weak var lap1SPTrexTF: XUITextField!
    @IBOutlet weak var lap1SPBanatTF: XUITextField!
    @IBOutlet weak var lap1SPDenariTF: XUITextField!
    @IBOutlet weak var lap1SPLatshTF: XUITextField!
    @IBOutlet weak var lap1SPKhetiarTF: XUITextField!
    @IBOutlet weak var lap1TPTrexTF: XUITextField!
    @IBOutlet weak var lap1TPBanatTF: XUITextField!
    @IBOutlet weak var lap1TPDenariTF: XUITextField!
    @IBOutlet weak var lap1TPLatshTF: XUITextField!
    @IBOutlet weak var lap1TPKhetiarTF: XUITextField!
    @IBOutlet weak var lap1FTPTrexTF: XUITextField!
    @IBOutlet weak var lap1FTPBanatTF: XUITextField!
    @IBOutlet weak var lap1FTPDenariTF: XUITextField!
    @IBOutlet weak var lap1FTPLatshTF: XUITextField!
    @IBOutlet weak var lap1FTPKhetiarTF: XUITextField!
    // second Lap
    @IBOutlet weak var lap2SPLabel: UILabel!
    @IBOutlet weak var lap2FPLabel: UILabel!
    @IBOutlet weak var lap2TPLabel: UILabel!
    @IBOutlet weak var lap2FTPLabel: UILabel!
    @IBOutlet weak var lap2FPResultLabel: UILabel!
    @IBOutlet weak var lap2SPResultLabel: UILabel!
    @IBOutlet weak var lap2TPResultLabel: UILabel!
    @IBOutlet weak var lap2FTPResultLabel: UILabel!
    @IBOutlet weak var lap2FPTrexTF: XUITextField!
    @IBOutlet weak var lap2FPBanatTF: XUITextField!
    @IBOutlet weak var lap2FPDenariTF: XUITextField!
    @IBOutlet weak var lap2FPLatshTF: XUITextField!
    @IBOutlet weak var lap2FPKhetiarTF: XUITextField!
    @IBOutlet weak var lap2SPTrexTF: XUITextField!
    @IBOutlet weak var lap2SPBanatTF: XUITextField!
    @IBOutlet weak var lap2SPDenariTF: XUITextField!
    @IBOutlet weak var lap2SPLatshTF: XUITextField!
    @IBOutlet weak var lap2SPKhetiarTF: XUITextField!
    @IBOutlet weak var lap2TPTrexTF: XUITextField!
    @IBOutlet weak var lap2TPBanatTF: XUITextField!
    @IBOutlet weak var lap2TPDenariTF: XUITextField!
    @IBOutlet weak var lap2TPLatshTF: XUITextField!
    @IBOutlet weak var lap2TPKhetiarTF: XUITextField!
    @IBOutlet weak var lap2FTPTrexTF: XUITextField!
    @IBOutlet weak var lap2FTPBanatTF: XUITextField!
    @IBOutlet weak var lap2FTPDenariTF: XUITextField!
    @IBOutlet weak var lap2FTPLatshTF: XUITextField!
    @IBOutlet weak var lap2FTPKhetiarTF: XUITextField!
    
    // third Lap
    @IBOutlet weak var lap3SPLabel: UILabel!
    @IBOutlet weak var lap3FPLabel: UILabel!
    @IBOutlet weak var lap3TPLabel: UILabel!
    @IBOutlet weak var lap3FTPLabel: UILabel!
    @IBOutlet weak var lap3FPResultLabel: UILabel!
    @IBOutlet weak var lap3SPResultLabel: UILabel!
    @IBOutlet weak var lap3TPResultLabel: UILabel!
    @IBOutlet weak var lap3FTPResultLabel: UILabel!
    @IBOutlet weak var lap3FPTrexTF: XUITextField!
    @IBOutlet weak var lap3FPBanatTF: XUITextField!
    @IBOutlet weak var lap3FPDenariTF: XUITextField!
    @IBOutlet weak var lap3FPLatshTF: XUITextField!
    @IBOutlet weak var lap3FPKhetiarTF: XUITextField!
    @IBOutlet weak var lap3SPTrexTF: XUITextField!
    @IBOutlet weak var lap3SPBanatTF: XUITextField!
    @IBOutlet weak var lap3SPDenariTF: XUITextField!
    @IBOutlet weak var lap3SPLatshTF: XUITextField!
    @IBOutlet weak var lap3SPKhetiarTF: XUITextField!
    @IBOutlet weak var lap3TPTrexTF: XUITextField!
    @IBOutlet weak var lap3TPBanatTF: XUITextField!
    @IBOutlet weak var lap3TPDenariTF: XUITextField!
    @IBOutlet weak var lap3TPLatshTF: XUITextField!
    @IBOutlet weak var lap3TPKhetiarTF: XUITextField!
    @IBOutlet weak var lap3FTPTrexTF: XUITextField!
    @IBOutlet weak var lap3FTPBanatTF: XUITextField!
    @IBOutlet weak var lap3FTPDenariTF: XUITextField!
    @IBOutlet weak var lap3FTPLatshTF: XUITextField!
    @IBOutlet weak var lap3FTPKhetiarTF: XUITextField!
    
    // forth Lap
    @IBOutlet weak var lap4SPLabel: UILabel!
    @IBOutlet weak var lap4FPLabel: UILabel!
    @IBOutlet weak var lap4TPLabel: UILabel!
    @IBOutlet weak var lap4FTPLabel: UILabel!
    @IBOutlet weak var lap4FPResultLabel: UILabel!
    @IBOutlet weak var lap4SPResultLabel: UILabel!
    @IBOutlet weak var lap4TPResultLabel: UILabel!
    @IBOutlet weak var lap4FTPResultLabel: UILabel!
    @IBOutlet weak var lap4FPTrexTF: XUITextField!
    @IBOutlet weak var lap4FPBanatTF: XUITextField!
    @IBOutlet weak var lap4FPDenariTF: XUITextField!
    @IBOutlet weak var lap4FPLatshTF: XUITextField!
    @IBOutlet weak var lap4FPKhetiarTF: XUITextField!
    @IBOutlet weak var lap4SPTrexTF: XUITextField!
    @IBOutlet weak var lap4SPBanatTF: XUITextField!
    @IBOutlet weak var lap4SPDenariTF: XUITextField!
    @IBOutlet weak var lap4SPLatshTF: XUITextField!
    @IBOutlet weak var lap4SPKhetiarTF: XUITextField!
    @IBOutlet weak var lap4TPTrexTF: XUITextField!
    @IBOutlet weak var lap4TPBanatTF: XUITextField!
    @IBOutlet weak var lap4TPDenariTF: XUITextField!
    @IBOutlet weak var lap4TPLatshTF: XUITextField!
    @IBOutlet weak var lap4TPKhetiarTF: XUITextField!
    @IBOutlet weak var lap4FTPTrexTF: XUITextField!
    @IBOutlet weak var lap4FTPBanatTF: XUITextField!
    @IBOutlet weak var lap4FTPDenariTF: XUITextField!
    @IBOutlet weak var lap4FTPLatshTF: XUITextField!
    @IBOutlet weak var lap4FTPKhetiarTF: XUITextField!
    
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultOverlayView: UIView!
    @IBOutlet weak var firstPlayerNameLabel: UILabel!
    @IBOutlet weak var secondPlayerNameLabel: UILabel!
    @IBOutlet weak var thirdPlayerNameLabel: UILabel!
    @IBOutlet weak var forthPlayerNameLabel: UILabel!
    @IBOutlet weak var firstPlayerResultLabel: UILabel!
    @IBOutlet weak var secondPlayerResultLabel: UILabel!
    @IBOutlet weak var thirdPlayerResultLabel: UILabel!
    @IBOutlet weak var forthPlayerResultLabel: UILabel!
    
    var firstPlayerResult:Int = 0 {
        didSet{
            self.lap1FPResultLabel.text = "\(firstPlayerResult)"
            self.lap2FPResultLabel.text = "\(firstPlayerResult)"
            self.lap3FPResultLabel.text = "\(firstPlayerResult)"
            self.lap4FPResultLabel.text = "\(firstPlayerResult)"
        }
    }
    
    var secondPlayerResult:Int = 0 {
        didSet{
            self.lap1SPResultLabel.text = "\(secondPlayerResult)"
            self.lap2SPResultLabel.text = "\(secondPlayerResult)"
            self.lap3SPResultLabel.text = "\(secondPlayerResult)"
            self.lap4SPResultLabel.text = "\(secondPlayerResult)"
        }
    }
    
    var thirdPlayerResult:Int = 0 {
        didSet{
            self.lap1TPResultLabel.text = "\(thirdPlayerResult)"
            self.lap2TPResultLabel.text = "\(thirdPlayerResult)"
            self.lap3TPResultLabel.text = "\(thirdPlayerResult)"
            self.lap4TPResultLabel.text = "\(thirdPlayerResult)"
        }
    }
    
    var forthPlayerResult:Int = 0 {
        didSet{
            self.lap1FTPResultLabel.text = "\(forthPlayerResult)"
            self.lap2FTPResultLabel.text = "\(forthPlayerResult)"
            self.lap3FTPResultLabel.text = "\(forthPlayerResult)"
            self.lap4FTPResultLabel.text = "\(forthPlayerResult)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        firstPlayerResult  = 0
        secondPlayerResult = 0
        thirdPlayerResult  = 0
        forthPlayerResult  = 0
        
        lap1FPLabel.text = DataStore.shared.currentGame?.players[0].name
        lap2FPLabel.text = DataStore.shared.currentGame?.players[0].name
        lap1FPLabel.text = DataStore.shared.currentGame?.players[0].name
        lap4FPLabel.text = DataStore.shared.currentGame?.players[0].name
        
        lap1SPLabel.text = DataStore.shared.currentGame?.players[1].name
        lap2SPLabel.text = DataStore.shared.currentGame?.players[1].name
        lap1SPLabel.text = DataStore.shared.currentGame?.players[1].name
        lap4SPLabel.text = DataStore.shared.currentGame?.players[1].name
        
        lap1TPLabel.text = DataStore.shared.currentGame?.players[2].name
        lap2TPLabel.text = DataStore.shared.currentGame?.players[2].name
        lap1TPLabel.text = DataStore.shared.currentGame?.players[2].name
        lap4TPLabel.text = DataStore.shared.currentGame?.players[2].name
        
        lap1FTPLabel.text = DataStore.shared.currentGame?.players[3].name
        lap2FTPLabel.text = DataStore.shared.currentGame?.players[3].name
        lap1FTPLabel.text = DataStore.shared.currentGame?.players[3].name
        lap4FTPLabel.text = DataStore.shared.currentGame?.players[3].name
        
        
        self.setNavBarTitle(title: "تركس")
        self.showNavBackButton = true
        NotificationCenter.default.addObserver(self, selector: #selector(getResult(_:)), name: .UITextViewTextDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .UITextViewTextDidChange, object: nil)
    }
    
    @IBAction func getResult(_ sender: Any) {
        
        var res1 = 0
        var res2 = 0
        var res3 = 0
        var res4 = 0
        
        
        
        res1 += lap1FPTrexTF.result + lap1FPBanatTF.result + lap1FPDenariTF.result + lap1FPLatshTF.result + lap1FPKhetiarTF.result
        res1 += lap2FPTrexTF.result + lap2FPBanatTF.result + lap2FPDenariTF.result + lap2FPLatshTF.result + lap2FPKhetiarTF.result
        res1 += lap3FPTrexTF.result + lap3FPBanatTF.result + lap3FPDenariTF.result + lap3FPLatshTF.result + lap3FPKhetiarTF.result
        res1 += lap4FPTrexTF.result + lap4FPBanatTF.result + lap4FPDenariTF.result + lap4FPLatshTF.result + lap4FPKhetiarTF.result
        firstPlayerResult = res1
        
        res2 += lap1SPTrexTF.result + lap1SPBanatTF.result + lap1SPDenariTF.result + lap1SPLatshTF.result + lap1SPKhetiarTF.result
        res2 += lap2SPTrexTF.result + lap2SPBanatTF.result + lap2SPDenariTF.result + lap2SPLatshTF.result + lap2SPKhetiarTF.result
        res2 += lap3SPTrexTF.result + lap3SPBanatTF.result + lap3SPDenariTF.result + lap3SPLatshTF.result + lap3SPKhetiarTF.result
        res2 += lap4SPTrexTF.result + lap4SPBanatTF.result + lap4SPDenariTF.result + lap4SPLatshTF.result + lap4SPKhetiarTF.result
        secondPlayerResult = res2
        
        res3 += lap1TPTrexTF.result + lap1TPBanatTF.result + lap1TPDenariTF.result + lap1TPLatshTF.result + lap1TPKhetiarTF.result
        res3 += lap2TPTrexTF.result + lap2TPBanatTF.result + lap2TPDenariTF.result + lap2TPLatshTF.result + lap2TPKhetiarTF.result
        res3 += lap3TPTrexTF.result + lap3TPBanatTF.result + lap3TPDenariTF.result + lap3TPLatshTF.result + lap3TPKhetiarTF.result
        res3 += lap4TPTrexTF.result + lap4TPBanatTF.result + lap4TPDenariTF.result + lap4TPLatshTF.result + lap4TPKhetiarTF.result
        thirdPlayerResult = res3
        
        res4 += lap1FTPTrexTF.result + lap1FTPBanatTF.result + lap1FTPDenariTF.result + lap1FTPLatshTF.result + lap1FTPKhetiarTF.result
        res4 += lap2FTPTrexTF.result + lap2FTPBanatTF.result + lap2FTPDenariTF.result + lap2FTPLatshTF.result + lap2FTPKhetiarTF.result
        res4 += lap3FTPTrexTF.result + lap3FTPBanatTF.result + lap3FTPDenariTF.result + lap3FTPLatshTF.result + lap3FTPKhetiarTF.result
        res4 += lap4FTPTrexTF.result + lap4FTPBanatTF.result + lap4FTPDenariTF.result + lap4FTPLatshTF.result + lap4FTPKhetiarTF.result
        forthPlayerResult = res4
        
    }
    
    @IBAction func done(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showResult(_ sender: UIButton) {
        self.firstPlayerNameLabel.text = DataStore.shared.currentGame?.players[0].name
        self.secondPlayerNameLabel.text = DataStore.shared.currentGame?.players[1].name
        self.thirdPlayerNameLabel.text = DataStore.shared.currentGame?.players[2].name
        self.forthPlayerNameLabel.text = DataStore.shared.currentGame?.players[3].name
        
        self.firstPlayerResultLabel.text = "\(self.firstPlayerResult)"
        self.secondPlayerResultLabel.text = "\(self.secondPlayerResult)"
        self.thirdPlayerResultLabel.text = "\(self.thirdPlayerResult)"
        self.forthPlayerResultLabel.text = "\(self.forthPlayerResult)"
        
        self.resultOverlayView.isHidden = false
        self.resultView.animateIn(mode: .animateInFromBottom, delay: 0.2)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.getResult(textField)
    }
}
