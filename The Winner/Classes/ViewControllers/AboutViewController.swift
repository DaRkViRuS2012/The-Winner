//
//  AboutViewController.swift
//  The Winner
//
//  Created by Nour  on 6/9/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class AboutViewController: AbstractController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.showNavBackButton = true
    }
    
    @IBAction func openWebSite(_ sender: UIButton) {
        
        self.openURL(url: "http://cards.appfirm.tech/winner")
        
    }
    
    @IBAction func openFaceBook(_ sender: UIButton) {
        
        self.openURL(url: "https://www.facebook.com/winneralrabeh")
        
    }
    
    @IBAction func openAppFirm(_ sender: UIButton) {
        self.openURL(url: "http://appfirm.tech/")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
