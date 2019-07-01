//
//  XUITextField.swift
//  Wardah
//
//  Created by Nour  on 12/22/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//

import Foundation
import UIKit
import DropDown
import NextResponderTextField

@IBDesignable
class XUITextField:NextResponderTextField{
    
    @IBInspectable var primary:Bool {
        didSet{
            if primary{
                if #available(iOS 10.0, *) {
                    self.keyboardType = UIKeyboardType.asciiCapableNumberPad
                } else {
                    self.keyboardType = UIKeyboardType.numberPad
                }
                
                
                self.textAlignment = .center
                self.languageCode = "en"
                self.contentVerticalAlignment = .center
                self.contentHorizontalAlignment = .center
                self.textAlignment = .center
                self.contentMode = .center
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
           NotificationCenter.default.post(name: .UITextViewTextDidChange, object: nil)
        }
    }
    
 
    
    @objc func doneTouchUpInside(_ sender: UIButton!) {
        _ = self.resignFirstResponder();
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

    
    var languageCode:String? = "en"{
        didSet{
            if self.isFirstResponder{
                _ = self.resignFirstResponder();
                _ = self.becomeFirstResponder();
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
    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.text = self.text?.getEnglishNumber()
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
         self.text = self.text?.getEnglishNumber()
        return true
    }

    @objc func textFieldDidChange(_ textField : UITextField){
        self.delegate?.textFieldDidBeginEditing?(self)
    }
    
    
    // better text field
    
    /// A buffer for the placeholder's text.
    fileprivate var placeholderText: String?
    
    /// Determines if the user manually changed the text margins.
    fileprivate var defaultMode = true
    
    /// The text's margin left manually set by the user.
    fileprivate var textMarginLeft: CGFloat = 10.0
    
    /// The text's margin right manually set by the user.
    fileprivate var textMarginRight: CGFloat = 0.0
    
    /// The text's margin left.
    @IBInspectable open var marginLeft: CGFloat {
        get {
            if defaultMode && self.clearButtonMode != .never && self.textAlignment == .center {
                return 24.0
            } else {
                return textMarginLeft
            }
        }
        
        set {
            defaultMode = false
            textMarginLeft = newValue
        }
    }
    
    /// The text's margin right.
    @IBInspectable open var marginRight: CGFloat {
        get {
            if defaultMode && self.clearButtonMode != .never {
                return 24.0
            } else {
                return textMarginRight
            }
        }
        
        set {
            defaultMode = false
            textMarginRight = newValue
        }
    }
    

    
    // MARK: - Overridden methods
    // Insets for the editable text position.
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        if primary{
            return bounds.insetBy(dx: marginLeft, dy: marginRight)
        }
        return bounds
        
    }
    
    // Insets for the placeholder position.
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        if primary{
            return bounds.insetBy(dx: marginLeft, dy: marginRight)
        }
        return bounds
    }
    
    // Insets for the text position.
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        if primary{
            return bounds.insetBy(dx: marginLeft, dy: marginRight)
        }
        return bounds
    }
    
    /*
     * Removes the placeholder text when text field becomes first responder to avoid cursor jumping,
     * if text alignment is set to centered.
     */
    override open func becomeFirstResponder() -> Bool {
        let becameFirstResponder = super.becomeFirstResponder()
        
        if becameFirstResponder {
            placeholderText = placeholder
            placeholder = ""
        }
        
        return becameFirstResponder
    }
    
    /*
     * Restores the placeholder text to its original value, before it was removed when text field became
     * first responder.
     */
    override open func resignFirstResponder() -> Bool {
        let resigendFirstResponder = super.resignFirstResponder()
        
        if resigendFirstResponder {
            placeholder = placeholderText
            placeholderText = ""
        }
        
        return resigendFirstResponder
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









