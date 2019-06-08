//
//  Offer.swift
//  The Winner
//
//  Created by Nour  on 5/25/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import Foundation
import SwiftyJSON


public class Offer:BaseModel {
    
    public var restaurant_name : String?
    public var priority : String?
    public var logo : String?
    public var cover : String?
    public var description : String?
    public var creation_date : String?
    
    
    // MARK: Initializers
    override init() {
        super.init()
    }
    
    required public init(json: JSON) {
        super.init(json: json)
        
        
        if let value = json["restaurant_name"].string {
            restaurant_name = value
        }
        
        if let value = json["priority"].string {
            priority = value
        }
        if let value = json["logo"].string {
            logo = value
        }
        
        if let value = json["cover"].string {
            cover = value
        }
        
        if let value = json["description"].string {
            description = value
        }
        if let value = json["creation_date"].string {
            creation_date = value
        }
   
    }
    
    
    override public func dictionaryRepresentation() -> [String:Any] {
        var dictionary = super.dictionaryRepresentation()
        dictionary["restaurant_name"] = restaurant_name
        dictionary["priority"] = priority
        dictionary["logo"] = logo
        dictionary["cover"] = cover
        dictionary["description"] = description
        dictionary["creation_date"] = creation_date
        
        return dictionary
    }
    
}
