//
//  ComplexNormalViewController.swift
//  The Winner
//
//  Created by Nour  on 6/28/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class ComplexNormalViewController: AbstractController {

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
    @IBOutlet weak var lap1FPComplexTF: XUITextField!
    @IBOutlet weak var lap1SPTrexTF: XUITextField!
    @IBOutlet weak var lap1SPComplexTF: XUITextField!
    @IBOutlet weak var lap1TPTrexTF: XUITextField!
    @IBOutlet weak var lap1TPComplexTF: XUITextField!
    @IBOutlet weak var lap1FTPTrexTF: XUITextField!
    @IBOutlet weak var lap1FTPComplexTF: XUITextField!
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
    @IBOutlet weak var lap2FPComplexTF: XUITextField!
    @IBOutlet weak var lap2SPTrexTF: XUITextField!
    @IBOutlet weak var lap2SPComplexTF: XUITextField!
    @IBOutlet weak var lap2TPTrexTF: XUITextField!
    @IBOutlet weak var lap2TPComplexTF: XUITextField!
    @IBOutlet weak var lap2FTPTrexTF: XUITextField!
    @IBOutlet weak var lap2FTPComplexTF: XUITextField!
    
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
    @IBOutlet weak var lap3FPComplexTF: XUITextField!
    @IBOutlet weak var lap3SPTrexTF: XUITextField!
    @IBOutlet weak var lap3SPComplexTF: XUITextField!
    @IBOutlet weak var lap3TPTrexTF: XUITextField!
    @IBOutlet weak var lap3TPComplexTF: XUITextField!
    @IBOutlet weak var lap3FTPTrexTF: XUITextField!
    @IBOutlet weak var lap3FTPComplexTF: XUITextField!
    
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
    @IBOutlet weak var lap4FPComplexTF: XUITextField!
    @IBOutlet weak var lap4SPTrexTF: XUITextField!
    @IBOutlet weak var lap4SPComplexTF: XUITextField!
    @IBOutlet weak var lap4TPTrexTF: XUITextField!
    @IBOutlet weak var lap4TPComplexTF: XUITextField!
    @IBOutlet weak var lap4FTPTrexTF: XUITextField!
    @IBOutlet weak var lap4FTPComplexTF: XUITextField!
    
    
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
          
        }
    }
    
    var secondPlayerResult:Int = 0 {
        didSet{
        
        }
    }
    
    var thirdPlayerResult:Int = 0 {
        didSet{
            
        }
    }
    
    var forthPlayerResult:Int = 0 {
        didSet{
            
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
        
        
        self.setNavBarTitle(title: "تركس كومبلكس")
        self.showNavBackButton = true
        NotificationCenter.default.addObserver(self, selector: #selector(getResult(_:)), name: .UITextViewTextDidChange, object: nil)
        self.hideTabBar()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .UITextViewTextDidChange, object: nil)
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
    
    @IBAction func getResult(_ sender: Any) {
    
        var res1 = 0
        var res2 = 0
        var res3 = 0
        var res4 = 0
        
        res1 = lap1FPTrexTF.result + lap1FPComplexTF.result
        self.lap1FPResultLabel.text = "\(res1)"
        res1 += lap2FPTrexTF.result + lap2FPComplexTF.result
        self.lap2FPResultLabel.text = "\(res1)"
        res1 += lap3FPTrexTF.result + lap3FPComplexTF.result
        self.lap3FPResultLabel.text = "\(res1)"
        res1 += lap4FPTrexTF.result + lap4FPComplexTF.result
        self.lap4FPResultLabel.text = "\(res1)"
        firstPlayerResult = res1
        
        
        
        
        
        
        res2 = lap1SPTrexTF.result + lap1SPComplexTF.result
        self.lap1SPResultLabel.text = "\(res2)"
        res2 += lap2SPTrexTF.result + lap2SPComplexTF.result
        self.lap2SPResultLabel.text = "\(res2)"
        res2 += lap3SPTrexTF.result + lap3SPComplexTF.result
        self.lap3SPResultLabel.text = "\(res2)"
        res2 += lap4SPTrexTF.result + lap4SPComplexTF.result
        self.lap4SPResultLabel.text = "\(res2)"
        secondPlayerResult = res2
        
        
        
        
        
        res3 = lap1TPTrexTF.result + lap1TPComplexTF.result
        self.lap1TPResultLabel.text = "\(res3)"
        res3 += lap2TPTrexTF.result + lap2TPComplexTF.result
        self.lap2TPResultLabel.text = "\(res3)"
        res3 += lap3TPTrexTF.result + lap3TPComplexTF.result
        self.lap3TPResultLabel.text = "\(res3)"
        res3 += lap4TPTrexTF.result + lap4TPComplexTF.result
        self.lap4TPResultLabel.text = "\(res3)"
        thirdPlayerResult = res3
        
        
        
        
        
        
        res4 = lap1FTPTrexTF.result + lap1FTPComplexTF.result
        self.lap2FTPResultLabel.text = "\(res4)"
        res4 += lap2FTPTrexTF.result + lap2FTPComplexTF.result
        self.lap2FTPResultLabel.text = "\(res4)"
        res4 += lap3FTPTrexTF.result + lap3FTPComplexTF.result
        self.lap3FTPResultLabel.text = "\(res4)"
        res4 += lap4FTPTrexTF.result + lap4FTPComplexTF.result
        self.lap4FTPResultLabel.text = "\(res4)"
        forthPlayerResult = res4
    
    }
    
    @IBAction func done(_ sender: UIButton) {
        self.popOrDismissViewControllerAnimated(animated: true)
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
        
        let alert = UIAlertController(title: "انهاء اللعبة؟", message: "لن تستطيع مشاهدة النتائج مرة اخرى", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "حسنا", style: .default) { (_) in
            self.resultOverlayView.isHidden = false
            self.resultView.animateIn(mode: .animateInFromBottom, delay: 0.2)
        }
        let cancelAction = UIAlertAction(title: "الغاء", style: .cancel) { (_) in
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
     
    }
 
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.getResult(textField)
    }
    
}
