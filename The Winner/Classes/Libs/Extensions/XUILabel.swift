//
//  XUILabel.swift
//  Wardah
//
//  Created by Nour  on 12/22/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class XUILabel:UILabel{
    
    @IBInspectable var localization: String = "" {
        didSet {
            self.text = localization.localized
        }
    }

    @IBInspectable var fontType: Int = 0 {
        didSet {
            switch (fontType){
            case 0:
                self.font = AppFonts.small
            case 1:
                self.font = AppFonts.normal
            case 2:
                self.font = AppFonts.big
            default:
                self.font = AppFonts.normal
            }
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        
//        if self.tag == -1{
//            self.font = AppFonts.xSmall
//        }else if self.tag > -1 {
//            self.font = AppFonts.normal
//        }else{
//            self.font = UIFont.systemFont(ofSize: 10)
//        }
       // setLineHeight(height: 0.5)
        self.text = self.text?.localized
    }

}




extension UILabel {





    open override func awakeFromNib() {
        super.awakeFromNib()
     //   setLineHeight(height: 1)
    }
    
    
}

