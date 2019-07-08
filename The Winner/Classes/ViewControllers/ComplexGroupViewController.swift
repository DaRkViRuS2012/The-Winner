//
//  ComplexGroupViewController.swift
//  The Winner
//
//  Created by Nour  on 6/28/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class ComplexGroupViewController: AbstractController {
    
    // first Lap
    @IBOutlet weak var lap1FPLabel: UILabel!
    
    @IBOutlet weak var lap1FPResultLabel: UILabel!
    
    @IBOutlet weak var lap1FPTrexTF: XUITextField!
    @IBOutlet weak var lap1FPComplexTF: XUITextField!
    
    // second Lap
    @IBOutlet weak var lap2FPResultLabel: UILabel!
    @IBOutlet weak var lap2FPTrexTF: XUITextField!
    @IBOutlet weak var lap2FPComplexTF: XUITextField!
    
    
    // third Lap
    @IBOutlet weak var lap3FPResultLabel: UILabel!
    @IBOutlet weak var lap3FPTrexTF: XUITextField!
    @IBOutlet weak var lap3FPComplexTF: XUITextField!
    
    
    // forth Lap

    @IBOutlet weak var lap4FPResultLabel: UILabel!
    
    @IBOutlet weak var lap4FPTrexTF: XUITextField!
    @IBOutlet weak var lap4FPComplexTF: XUITextField!
    
    
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultOverlayView: UIView!
    @IBOutlet weak var firstPlayerNameLabel: UILabel!
    @IBOutlet weak var firstPlayerResultLabel: UILabel!
    
    
    var firstPlayerResult:Int = 0 {
        didSet{
           
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        firstPlayerResult = 0
    
        lap1FPLabel.text = DataStore.shared.currentGame?.players[0].name
        
        self.setNavBarTitle(title: "تركس كومبلكس")
        self.showNavBackButton = true
        NotificationCenter.default.addObserver(self, selector: #selector(getResult(_:)), name: .UITextViewTextDidChange, object: nil)
        self.hideTabBar()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .UITextViewTextDidChange, object: nil)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func backButtonAction(_ sender: AnyObject) {
        let alert = UIAlertController(title: "خروج؟", message: "لن تستطيع مشاهدة النتائج مرة اخرى", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "حسنا", style: .default) { (_) in
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
        
        
        res1 = lap1FPTrexTF.result + lap1FPComplexTF.result
        self.lap1FPResultLabel.text = "\(res1)"
        res1 += lap2FPTrexTF.result + lap2FPComplexTF.result
        self.lap2FPResultLabel.text = "\(res1)"
        res1 += lap3FPTrexTF.result + lap3FPComplexTF.result
        self.lap3FPResultLabel.text = "\(res1)"
        res1 += lap4FPTrexTF.result + lap4FPComplexTF.result
        self.lap4FPResultLabel.text = "\(res1)"
        firstPlayerResult = res1
        
        
        
        
        
    
        
    }
    @IBAction func done(_ sender: UIButton) {
        self.popOrDismissViewControllerAnimated(animated: true)
    }
    
    @IBAction func showResult(_ sender: UIButton) {
        self.firstPlayerNameLabel.text = DataStore.shared.currentGame?.players[0].name
    

        self.firstPlayerResultLabel.text = "\(self.firstPlayerResult)"
        
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
