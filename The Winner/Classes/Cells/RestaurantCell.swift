//
//  RestaurantCell.swift
//  The Winner
//
//  Created by Nour  on 5/25/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phone1Label: UILabel!
    @IBOutlet weak var phone2Label: UILabel!
    @IBOutlet weak var openHoursLabel: UILabel!
    
    var restaurant:Restaurant?{
        didSet{
            guard let restaurant = restaurant else {return}
            
            if let name = restaurant.name {
                nameLabel.text = name
            }
            
            if let cover = restaurant.cover?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                imageView.setImageForURL(cover, placeholder: nil)
            }
            
            if let address = restaurant.address{
                addressLabel.text = address
            }
            
            if let phone = restaurant.phone{
                phone1Label.text = phone
            }
            
            if let phone2 = restaurant.phone2{
                phone2Label.text = phone2
            }
            
            if let hours = restaurant.openhours{
                openHoursLabel.text = hours
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func callPhone1(_ sender: UIButton) {
    }
    
    @IBAction func callPhone2(_ sender: UIButton) {
    }
    
}
