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
    
    public var rId : String?
    public var name : String?
    public var cover : String?
    public var priority : String?
    public var phone : String?
    public var phone2 : String?
    public var address : String?
    public var openhours : String?
    
    
    // MARK: Initializers
    override init() {
        super.init()
    }
    
    required public init(json: JSON) {
        super.init(json: json)
        
        
        if let value = json["id"].string {
            rId = value
        }
        
        if let value = json["name"].string {
            name = value
        }
        if let value = json["cover"].string {
            cover = value
        }
        
        if let value = json["priority"].string {
            priority = value
        }
        
        if let value = json["phone"].string {
            phone = value
        }
        if let value = json["phone2"].string {
            phone2 = value
        }
        
        if let value = json["address"].string {
            address = value
        }
        
   
        
    }
    
    
    override public func dictionaryRepresentation() -> [String:Any] {
        var dictionary = super.dictionaryRepresentation()
        dictionary["id"] = rId
        dictionary["name"] = name
        dictionary["priority"] = priority
        dictionary["cover"] = cover
        dictionary["phone"] = phone
        dictionary["address"] = address
        dictionary["openhours"] = openhours
        
        return dictionary
    }
    
}
