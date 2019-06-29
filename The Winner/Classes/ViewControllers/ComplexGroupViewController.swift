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
            self.lap1FPResultLabel.text = "\(firstPlayerResult)"
            self.lap2FPResultLabel.text = "\(firstPlayerResult)"
            self.lap3FPResultLabel.text = "\(firstPlayerResult)"
            self.lap4FPResultLabel.text = "\(firstPlayerResult)"
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        firstPlayerResult = 0
    
        lap1FPLabel.text = DataStore.shared.currentGame?.players[0].name
        
        self.setNavBarTitle(title: "تركس كومبلكس")
        self.showNavBackButton = true
    }
    
    
    @IBAction func getResult(_ sender: UITextField) {
        
        var res1 = 0
        
        
        res1 += lap1FPTrexTF.result + lap1FPComplexTF.result
        res1 += lap2FPTrexTF.result + lap2FPComplexTF.result
        res1 += lap3FPTrexTF.result + lap3FPComplexTF.result
        res1 += lap4FPTrexTF.result + lap4FPComplexTF.result
        firstPlayerResult = res1
    
        
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
    
}
