//
//  XUITextField.swift
//  Wardah
//
//  Created by Nour  on 12/22/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//

import Foundation
import UIKit




@IBDesignable
class XUITextField:UITextField{
    
    @IBInspectable var primary:Bool {
        didSet{
            if primary{
                self.keyboardType = UIKeyboardType.decimalPad
                self.textAlignment = .center
                self.languageCode = "en"
            }
        }
    }
    
    init(primary:Bool){
        self.primary = primary
        super.init(frame:CGRect.zero)
    }
    
    
    override init(frame: CGRect) {
        self.primary = false
        super.init(frame: frame)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.primary = false
        super.init(coder: aDecoder)
        
    }
    
    
    fileprivate func getAccessoryButtons() -> UIView
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.superview!.frame.size.width, height: 44))
        view.backgroundColor = UIColor.lightGray
        
        let minusButton = UIButton(type: UIButton.ButtonType.custom)
        let doneButton = UIButton(type: UIButton.ButtonType.custom)
        minusButton.setTitle("-", for: UIControl.State())
        doneButton.setTitle("Done", for: UIControl.State())
        let buttonWidth = view.frame.size.width/3;
        minusButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: 44);
        doneButton.frame = CGRect(x: view.frame.size.width - buttonWidth, y: 0, width: buttonWidth, height: 44);
        
        minusButton.addTarget(self, action: #selector(minusTouchUpInside(_:)), for: UIControl.Event.touchUpInside)
        doneButton.addTarget(self, action: #selector(doneTouchUpInside(_:)), for: UIControl.Event.touchUpInside)
        
        view.addSubview(minusButton)
        view.addSubview(doneButton)
        
        return view;
    }
    
    @objc func minusTouchUpInside(_ sender: UIButton!) {
        
        let text = self.text!
        if(text.count > 0) {
            let index: String.Index = text.index(text.startIndex, offsetBy: 1)
            let firstChar = text[..<index]
            if firstChar == "-" {
                self.text = String(text[index...])
            } else {
                self.text = "-" + text
            }
        }
    }
    
    @objc func doneTouchUpInside(_ sender: UIButton!) {
        self.resignFirstResponder();
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if primary{
            self.inputAccessoryView = getAccessoryButtons()
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.appStyle()
        
        self.placeholder = self.placeholder?.localized
    }

    
    var languageCode:String?{
        didSet{
            if self.isFirstResponder{
                self.resignFirstResponder();
                self.becomeFirstResponder();
            }
        }
    }
    
    override var textInputMode: UITextInputMode?{
        if let language_code = self.languageCode{
            for keyboard in UITextInputMode.activeInputModes{
                if let language = keyboard.primaryLanguage{
                    let locale = Locale.init(identifier: language);
                    if locale.languageCode == language_code{
                        return keyboard;
                    }
                }
            }
        }
        return super.textInputMode;
    }

    
    var result:Int{
        if let t = self.text, let num = Int(t){
            return num
        }
        return 0
    }
}


class PasswordTextField:UITextField{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if tag != -1{
            self.appStyle()
        }
        self.placeholder = self.placeholder?.localized
        self.font = AppFonts.normal
        self.addIconButton()
    }
    
    func addIconButton(){
        
        self.addIconButton(image: "eyeIcon")
        let passwordTextFieldRightButton = self.rightView as! UIButton
        passwordTextFieldRightButton.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        
        
    }
    
    @objc func hideText(){
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
    
    

}









