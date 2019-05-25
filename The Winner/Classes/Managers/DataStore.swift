//
//  DataStore.swift
//  
//
//  Created by Molham Mahmoud on 14/11/16.
//  Copyright © 2016 BrainSocket. All rights reserved.
//

import SwiftyJSON


/**This class handle all data needed by view controllers and other app classes
 
 It deals with:
 - Userdefault for read/write cached data
 - Any other data sources e.g social provider, contacts manager, etc..
 **Usag:**
 - to write something to chach add constant key and a computed property accessors (set,get) and use the according method  (save,load)
 */
class DataStore :NSObject {
    
    //MARK: Cache keys
    private let CACHE_KEY_CATEGORIES = "categories"
    private let CACHE_KEY_CATEGORIES_FILTERS = "categories_filters"
    private let CACHE_KEY_POST_CATEGORIES = "postcategories"
    private let CACHE_KEY_SHORES = "SHORES"
    private let CACHE_KEY_SHOPITEM = "SHOPITEM"
    private let CACHE_KEY_INVENTORY = "INVENTORY_ITEMS"
    private let CACHE_KEY_REPORT_TYPES = "REPORT_TYPES"
    private let CACHE_KEY_AD_CATEGORY = "ADCategory"
    private let CACHE_KEY_AD_SUB_CATEGORY = "ADSUBCategory"
    private let CACHE_KEY_BUSSINESS = "bussiness"
    private let CACHE_KEY_NOTIFICATION = "notification"
    private let CACHE_KEY_CITY = "cities"
    private let CACHE_KEY_CITY_FILTERS = "citiesfilters"
    private let CACHE_KEY_AREA = "area"
    private let CACHE_KEY_USER = "user"
    private let CACHE_KEY_TOKEN = "token"
    private let CACHE_KEY_MY_BOTTLES = "myBottles"
    private let CACHE_KEY_MY_REPLIES = "myReplies"
    private let CACHE_KEY_POSTS = "posts"
    private let CACHE_KEY_Volume = "volume"
    private let CACHE_KEY_FAVORITE = "favorites"
    //MARK: Temp data holders
    //keep reference to the written value in another private property just to prevent reading from cache each time you use this var
    private var _me:AppUser?

    private var _cities:[City] = [City]()
    private var _areas:[City] = [City]()

    
 

    
    
    public var location:Location = Location()
    
    public var currentUTCTime:TimeInterval {
        get {
            return Date().timeIntervalSince1970 * 1000
        }
    }
    
    //MARK: Singelton
    public static var shared: DataStore = DataStore()
    
    private override init(){
        super.init()
    }
   
    //MARK: Cache Utils
    private func saveBaseModelArray(array: [BaseModel] , withKey key:String){
        let array : [[String:Any]] = array.map{$0.dictionaryRepresentation()}
        UserDefaults.standard.set(array, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    private func loadBaseModelArrayForKey<T:BaseModel>(key: String)->[T]{
        var result : [T] = []
        if let arr = UserDefaults.standard.array(forKey: key) as? [[String: Any]]
        {
            result = arr.map{T(json: JSON($0))}
        }
        return result
    }
    
    public func saveBaseModelObject<T:BaseModel>(object:T?, withKey key:String)
    {
        UserDefaults.standard.set(object?.dictionaryRepresentation(), forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    public func loadBaseModelObjectForKey<T:BaseModel>(key:String) -> T?
    {
        if let object = UserDefaults.standard.object(forKey: key)
        {
            return T(json: JSON(object))
        }
        return nil
    }
    
    private func loadStringForKey(key:String) -> String{
        let storedString = UserDefaults.standard.object(forKey: key) as? String ?? ""
        return storedString;
    }
    
    private func saveStringWithKey(stringToStore: String, key: String){
        UserDefaults.standard.set(stringToStore, forKey: key);
        UserDefaults.standard.synchronize();
    }
    
    private func loadIntForKey(key:String) -> Int{
        let storedInt = UserDefaults.standard.object(forKey: key) as? Int ?? 0
        return storedInt;
    }
    
    private func saveIntWithKey(intToStore: Int, key: String){
        UserDefaults.standard.set(intToStore, forKey: key);
        UserDefaults.standard.synchronize();
    }
    
    public func onUserLogin(){
//        if let meId = me?.objectId, let name = me?.userName {
//            OneSignal.sendTags(["user_id": meId, "user_name": name])
//        }
    }
    
    public func clearCache()
    {
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
        }
    }
    

    
    public func logout() {
        clearCache()

    }
}





