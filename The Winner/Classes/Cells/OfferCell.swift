//
//  OfferCell.swift
//  The Winner
//
//  Created by Nour  on 6/8/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class OfferCell: UICollectionViewCell {
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    
    
    var offer:Offer?{
        didSet{
            guard let offer = offer else {return}
            if let name = offer.restaurant_name{
                titleLable.text = name
            }
            
            if let logo = offer.logo{
                logoImageView.setImageForURL(logo, placeholder: nil)
            }
            
            if let cover = offer.cover{
                imageView.setImageForURL(cover, placeholder: nil)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
