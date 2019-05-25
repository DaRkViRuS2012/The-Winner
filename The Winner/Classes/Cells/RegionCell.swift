//
//  RegionCell.swift
//  The Winner
//
//  Created by Nour  on 5/25/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class RegionCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var region:City?{
        didSet{
            guard let region = region else {return}
            nameLabel.text = region.name
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
