//
//  CityCell.swift
//  The Winner
//
//  Created by Nour  on 5/25/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class CityCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    var city:City?{
        didSet{
            guard let city = city else {return}
            if let name = city.name{
                nameLabel.text = name
            }
            
            
            if let cover = city.cover?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
                imageView.setImageForURL(cover, placeholder: nil)
            }
            
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
