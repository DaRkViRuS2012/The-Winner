//
//  XUILabel.swift
//  Wardah
//
//  Created by Nour  on 12/22/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//


import UIKit
import DropDown

protocol XUIButtonDelegate {
    func didSelecteItem(index:Int,title:String)
}

@IBDesignable
class XUIButton:UIButton{
    
    // drop Down
    let dropDown = DropDown()
    var hasDropDown:Bool = false
    var itemList:[String] = []{
        didSet{
            hasDropDown = true
            
            prepareDropDown()
        }
    }
    
    var xDelegate: XUIButtonDelegate?
    
    
    @IBInspectable var localization: String = "" {
        didSet {
            self.setTitle(localization.localized, for: .normal)
        }
    }
    
    @IBInspectable var primary:Bool {
        didSet{
            if primary{
                self.backgroundColor = AppColors.primary
                borderWidth = 1
                isSelected = false
                self.tintColor = .clear
                
                self.makeRounded()
                self.setTitleColor(.white, for: .normal)
                self.setTitleColor(AppColors.primary,for: .selected)
            }
        }
    }
    
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = !isSelected ? AppColors.primary :  UIColor.white
            layer.borderColor = !isSelected ? UIColor.white.cgColor : AppColors.primary.cgColor
          
        }
    }
    
    
    init(primary:Bool){
        self.primary = primary
        super.init(frame:CGRect.zero)
    }
    
    
    override init(frame: CGRect) {
        self.primary = true
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.primary = true
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
            self.titleLabel?.font = AppFonts.normalBold
            let currentTitle = self.currentTitle
            self.setTitle(currentTitle?.localized, for: .normal)
        if AppConfig.currentLanguage == .english{
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
            
        }else{
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -20)
        }
        
        if hasDropDown{
            prepareDropDown()
        }
    }
    
    func prepareDropDown(){
        dropDown.dataSource = itemList
        self.addTarget(self, action: #selector(toggleDropDown), for: .touchUpInside)
        dropDown.anchorView = self
        dropDown.width = 200
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            self.setTitle(item, for: .normal)
            self.xDelegate?.didSelecteItem(index: index, title: item)
        }
    }
    
    @objc func toggleDropDown(){
        if dropDown.isHidden{
            dropDown.show()
        }else{
            dropDown.hide()
        }
    }
    
    var result:Int{
        if let t = self.currentTitle, let num = Int(t){
            return num
        }
        return 0
    }
    
  
    
}
