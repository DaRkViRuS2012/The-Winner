//
//  TrexGroupViewController.swift
//  The Winner
//
//  Created by Nour  on 6/30/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class TrexGroupViewController:  AbstractController {
    
    // first Lap
    @IBOutlet weak var lap1FPLabel: UILabel!
    @IBOutlet weak var lap1FPResultLabel: UILabel!
    @IBOutlet weak var lap1FPTrexTF: XUIButton!
    @IBOutlet weak var lap1FPBanatTF: XUIButton!
    @IBOutlet weak var lap1FPDenariTF: XUIButton!
    @IBOutlet weak var lap1FPLatshTF: XUIButton!
    @IBOutlet weak var lap1FPKhetiarTF: XUIButton!
    @IBOutlet weak var lap1FPTrexResultLabel:UILabel!
    @IBOutlet weak var lap1FPBanatResultLabel:UILabel!
    @IBOutlet weak var lap1FPDenariResultLabel:UILabel!
    @IBOutlet weak var lap1FPLatshResultLabel:UILabel!
    @IBOutlet weak var lap1FPKhetiarResultLabel:UILabel!
    // second Lap
    @IBOutlet weak var lap2FPResultLabel: UILabel!
    @IBOutlet weak var lap2FPTrexTF: XUIButton!
    @IBOutlet weak var lap2FPBanatTF: XUIButton!
    @IBOutlet weak var lap2FPDenariTF: XUIButton!
    @IBOutlet weak var lap2FPLatshTF: XUIButton!
    @IBOutlet weak var lap2FPKhetiarTF: XUIButton!
    @IBOutlet weak var lap2FPTrexResultLabel:UILabel!
    @IBOutlet weak var lap2FPBanatResultLabel:UILabel!
    @IBOutlet weak var lap2FPDenariResultLabel:UILabel!
    @IBOutlet weak var lap2FPLatshResultLabel:UILabel!
    @IBOutlet weak var lap2FPKhetiarResultLabel:UILabel!
    // third Lap
    @IBOutlet weak var lap3FPResultLabel: UILabel!
    @IBOutlet weak var lap3FPTrexTF: XUIButton!
    @IBOutlet weak var lap3FPBanatTF: XUIButton!
    @IBOutlet weak var lap3FPDenariTF: XUIButton!
    @IBOutlet weak var lap3FPLatshTF: XUIButton!
    @IBOutlet weak var lap3FPKhetiarTF: XUIButton!
    @IBOutlet weak var lap3FPTrexResultLabel:UILabel!
    @IBOutlet weak var lap3FPBanatResultLabel:UILabel!
    @IBOutlet weak var lap3FPDenariResultLabel:UILabel!
    @IBOutlet weak var lap3FPLatshResultLabel:UILabel!
    @IBOutlet weak var lap3FPKhetiarResultLabel:UILabel!
    
    // forth Lap
    @IBOutlet weak var lap4FPResultLabel: UILabel!
    @IBOutlet weak var lap4FPTrexTF: XUIButton!
    @IBOutlet weak var lap4FPBanatTF: XUIButton!
    @IBOutlet weak var lap4FPDenariTF: XUIButton!
    @IBOutlet weak var lap4FPLatshTF: XUIButton!
    @IBOutlet weak var lap4FPKhetiarTF: XUIButton!
    @IBOutlet weak var lap4FPTrexResultLabel:UILabel!
    @IBOutlet weak var lap4FPBanatResultLabel:UILabel!
    @IBOutlet weak var lap4FPDenariResultLabel:UILabel!
    @IBOutlet weak var lap4FPLatshResultLabel:UILabel!
    @IBOutlet weak var lap4FPKhetiarResultLabel:UILabel!
    
    
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
    
  
    var trexNumbers:[String] = ["-","350","300","250","200","150"]
    var banatDoubleNumber:[String] = ["0","-25","-50","-75","-100","-125","-150","-175","-200","25","50","75","100"]
    var banatNumber:[String] = ["0","-25","-50","-75","-100"]
    var latshNumber:[String] = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13"]
    var khtiarNumber:[String] = ["0","-75"]
    var khtiarDoubleNumber:[String] = ["0","-75","-150","75"]
    var dinarNumber :[String] = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        firstPlayerResult  = 0
        
        lap1FPLabel.text = DataStore.shared.currentGame?.players[0].name
        
        lap1FPTrexTF.xDelegate = self
        lap1FPBanatTF.xDelegate = self
        lap1FPDenariTF.xDelegate = self
        lap1FPLatshTF.xDelegate = self
        lap1FPKhetiarTF.xDelegate = self
        
        lap2FPTrexTF.xDelegate = self
        lap2FPBanatTF.xDelegate = self
        lap2FPDenariTF.xDelegate = self
        lap2FPLatshTF.xDelegate = self
        lap2FPKhetiarTF.xDelegate = self
        
        lap3FPTrexTF.xDelegate = self
        lap3FPBanatTF.xDelegate = self
        lap3FPDenariTF.xDelegate = self
        lap3FPLatshTF.xDelegate = self
        lap3FPKhetiarTF.xDelegate = self
        
        lap4FPTrexTF.xDelegate = self
        lap4FPBanatTF.xDelegate = self
        lap4FPDenariTF.xDelegate = self
        lap4FPLatshTF.xDelegate = self
        lap4FPKhetiarTF.xDelegate = self
        
        lap1FPTrexTF.itemList = trexNumbers
        lap1FPDenariTF.itemList = dinarNumber
        lap1FPLatshTF.itemList = latshNumber
        if let type = DataStore.shared.currentGame?.type , type == .trexGroupNormal{
            lap1FPBanatTF.itemList = banatNumber
            lap1FPKhetiarTF.itemList =  khtiarNumber
        }else{
            lap1FPBanatTF.itemList = banatDoubleNumber
            lap1FPKhetiarTF.itemList =  khtiarDoubleNumber
        }
        
        lap2FPTrexTF.itemList = trexNumbers
        lap2FPDenariTF.itemList = dinarNumber
        lap2FPLatshTF.itemList = latshNumber
        if let type = DataStore.shared.currentGame?.type , type == .trexGroupNormal{
            lap2FPBanatTF.itemList = banatNumber
            lap2FPKhetiarTF.itemList = khtiarNumber
        }else{
            lap2FPBanatTF.itemList = banatDoubleNumber
            lap2FPKhetiarTF.itemList = khtiarDoubleNumber
        }
        
        lap3FPTrexTF.itemList = trexNumbers
        lap3FPDenariTF.itemList = dinarNumber
        lap3FPLatshTF.itemList = latshNumber
        if let type = DataStore.shared.currentGame?.type , type == .trexGroupNormal{
            lap3FPBanatTF.itemList = banatNumber
            lap3FPKhetiarTF.itemList = khtiarNumber
        }else{
            lap3FPBanatTF.itemList = banatDoubleNumber
            lap3FPKhetiarTF.itemList = khtiarDoubleNumber
        }
        
        lap4FPTrexTF.itemList = trexNumbers
        lap4FPDenariTF.itemList = dinarNumber
        lap4FPLatshTF.itemList = latshNumber
        if let type = DataStore.shared.currentGame?.type , type == .trexGroupNormal{
            lap4FPBanatTF.itemList = banatNumber
            lap4FPKhetiarTF.itemList = khtiarNumber
        }else{
            lap4FPBanatTF.itemList = banatDoubleNumber
            lap4FPKhetiarTF.itemList = khtiarDoubleNumber
        }
        self.setNavBarTitle(title: "تركس")
        self.showNavBackButton = true
        getResult()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getResult), name: .UITextViewTextDidChange, object: nil)
    }
    
    deinit {
          NotificationCenter.default.removeObserver(self, name: .UITextViewTextDidChange, object: nil)
    }
    
    @objc func getResult() {
        
        var res1 = 0
        
        res1 += lap1FPTrexTF.result + lap1FPBanatTF.result + (lap1FPDenariTF.result * -10) + (lap1FPLatshTF.result * -15) + lap1FPKhetiarTF.result
        res1 += lap2FPTrexTF.result + lap2FPBanatTF.result + (lap2FPDenariTF.result * -10) + (lap2FPLatshTF.result * -15) + lap2FPKhetiarTF.result
        res1 += lap3FPTrexTF.result + lap3FPBanatTF.result + (lap3FPDenariTF.result * -10) + (lap3FPLatshTF.result * -15) + lap3FPKhetiarTF.result
        res1 += lap4FPTrexTF.result + lap4FPBanatTF.result + (lap4FPDenariTF.result * -10) + (lap4FPLatshTF.result * -15) + lap4FPKhetiarTF.result
        firstPlayerResult = res1
        
        
        lap1FPTrexResultLabel.text =  "\(lap1FPTrexTF.result)"
        lap1FPBanatResultLabel.text = "\(lap1FPBanatTF.result)"
        lap1FPDenariResultLabel.text = "\(lap1FPDenariTF.result * -10)"
        lap1FPLatshResultLabel.text = "\(lap1FPLatshTF.result * -15)"
        lap1FPKhetiarResultLabel.text = "\(lap1FPKhetiarTF.result)"
        
  
        lap2FPTrexResultLabel.text =    "\(lap2FPTrexTF.result)"
        lap2FPBanatResultLabel.text =   "\(lap2FPBanatTF.result)"
        lap2FPDenariResultLabel.text =  "\(lap2FPDenariTF.result * -10)"
        lap2FPLatshResultLabel.text =   "\(lap2FPLatshTF.result * -15)"
        lap2FPKhetiarResultLabel.text = "\(lap2FPKhetiarTF.result)"
        
        
        lap3FPTrexResultLabel.text   =  "\(lap3FPTrexTF.result)"
        lap3FPBanatResultLabel.text   = "\(lap3FPBanatTF.result)"
        lap3FPDenariResultLabel.text  = "\(lap3FPDenariTF.result * -10)"
        lap3FPLatshResultLabel.text   = "\(lap3FPLatshTF.result * -15)"
        lap3FPKhetiarResultLabel.text = "\(lap3FPKhetiarTF.result)"
        
        
        lap4FPTrexResultLabel.text   =  "\(lap4FPTrexTF.result)"
        lap4FPBanatResultLabel.text   = "\(lap4FPBanatTF.result)"
        lap4FPDenariResultLabel.text  = "\(lap4FPDenariTF.result * -10)"
        lap4FPLatshResultLabel.text   = "\(lap4FPLatshTF.result * -15)"
        lap4FPKhetiarResultLabel.text = "\(lap4FPKhetiarTF.result)"
        
    }
    
    @IBAction func done(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showResult(_ sender: UIButton) {
        self.firstPlayerNameLabel.text = DataStore.shared.currentGame?.players[0].name
    
        self.firstPlayerResultLabel.text = "\(self.firstPlayerResult)"
        
        self.resultOverlayView.isHidden = false
        self.resultView.animateIn(mode: .animateInFromBottom, delay: 0.2)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.getResult()
    }
    
}
extension TrexGroupViewController:XUIButtonDelegate{
    func didSelecteItem(index: Int, title: String) {
        getResult()
    }
}

