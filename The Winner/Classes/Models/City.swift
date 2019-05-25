//
//  businessCategories.swift
//  GlobalPages
//
//  Created by Nour  on 8/3/18.
//  Copyright © 2018 GlobalPages. All rights reserved.
//

import UIKit
import SwiftyJSON

public class City: BaseModel {
    // MARK: Keys
    private let kCategoryName: String = "name"
    private let kCover: String = "cover"
    private let kCategoryID: String = "id"
    
    
    // MARK: Properties
    public var name:String?
    public var cID:String?
    public var cover :String?
    

    // MARK: Initializers
    override init() {
        super.init()
    }
    
    required public init(json: JSON) {
        super.init(json: json)
        if let value = json[kCategoryName].string {
            name = value
        }
        
        if let value = json[kCover].string {
            cover = value
        }
        
        
        if let value = json[kCategoryID].string {
            cID = value
        }
        
        

        
    }
    
    override public func dictionaryRepresentation() -> [String : Any] {
        var dictionary = super.dictionaryRepresentation()
        if let value = name {
            dictionary[kCategoryName] = value
        }
        if let value = cID {
            dictionary[kCategoryID] = value
        }
        if let value = cover {
            dictionary[kCover] = value
        }
        
        return dictionary
    }
}


