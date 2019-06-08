//
//  ApiManager.swift
//
//  Created by Molham Mahmoud on 25/04/16.
//  Copyright © 2016. All rights reserved.
//

import SwiftyJSON
import Alamofire
import UIKit

/// - Api store do all Networking stuff
///     - build server request 
///     - prepare params
///     - and add requests headers
///     - parse Json response to App data models
///     - parse error code to Server error object
///
class ApiManager: NSObject {

    typealias Payload = (MultipartFormData) -> Void
    
    /// frequent request headers
    var headers: HTTPHeaders{
        get{
            let httpHeaders:[String:String] = [
                :
                
            ]
            return httpHeaders
        }
    }
    
    let baseURL = "http://cards.appfirm.tech"
    let error_domain = ""
    
    //MARK: Shared Instance
    static let shared: ApiManager = ApiManager()
    
    private override init(){
        super.init()
    }    


    // MARK: Authorization


   
  
    // set FCM Token
    func setFCMToken(token: String, completionBlock: @escaping (_ success: Bool, _ error: ServerError?, _ user:AppUser?) -> Void) {
        // url & parameters
        let signUpURL = "\(baseURL)/users/fcmToken"

        let parameters : [String : String] = ["token": token]

        // build request
        Alamofire.request(signUpURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                let jsonResponse = JSON(responseObject.result.value!)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    let serverError = ServerError(json: jsonResponse["error"]) ?? ServerError.unknownError
                    completionBlock(false , serverError, nil)
                } else {
                    // parse response to data model >> user object
//                    let user = AppUser(json: jsonResponse)
//                    DataStore.shared.me = user
                    //DataStore.shared.onUserLogin()
                    completionBlock(true , nil, nil)
                }
            }
            // Network error request time out or server error with no payload
            if responseObject.result.isFailure {
                let nsError : NSError = responseObject.result.error! as NSError
                print(nsError.localizedDescription)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    completionBlock(false, ServerError.unknownError, nil)
                } else {
                    completionBlock(false, ServerError.connectionError, nil)
                }
            }
        }
    }


  
    // get Countries
    func getCountries(completionBlock: @escaping (_ success: Bool, _ error: ServerError?,_ result : [City]) -> Void) {
        // url & parameters
        let bottleURL = "\(baseURL)/getCities.php"
        
        // build request
        Alamofire.request(bottleURL, method: .get,encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                let jsonResponse = JSON(responseObject.result.value!)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    let serverError = ServerError(json: jsonResponse["error"]) ?? ServerError.unknownError
                    completionBlock(false , serverError,[])
                } else {
                    if let array = jsonResponse.array{
                        let cities = array.map{City(json:$0)}
//                        DataStore.shared.notifications = notifications
                        completionBlock(true , nil,cities)
                    }else{
                        completionBlock(true , nil,[])
                    }
                }
            }
            // Network error request time out or server error with no payload
            if responseObject.result.isFailure {
                if let code = responseObject.response?.statusCode, code >= 400 {
                    completionBlock(false, ServerError.unknownError,[])
                } else {
                    completionBlock(false, ServerError.connectionError,[])
                }
            }
        }
    }
    

    func getRegions(city_id:String ,completionBlock: @escaping (_ success: Bool, _ error: ServerError?, _ result:[City]) -> Void) {
        // url & parameters
        let signInURL = "\(baseURL)/getRegiones.php"
        let parameters : [String : Any] = [
            "city_id":Int(city_id)!
        ]
        // build request
        Alamofire.request(signInURL, method: .post, parameters: parameters).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                let jsonResponse = JSON(responseObject.result.value!)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    let serverError = ServerError(json: jsonResponse["error"]) ?? ServerError.unknownError
                    completionBlock(false , serverError,[])
                } else {
                    if let array = jsonResponse.array{
                        let cities = array.map{City(json:$0)}
                        completionBlock(true , nil,cities)
                    }else{
                        completionBlock(true , nil,[])
                    }
                }
            }
            // Network error request time out or server error with no payload
            if responseObject.result.isFailure {
                let nsError : NSError = responseObject.result.error! as NSError
                print(nsError.localizedDescription)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    completionBlock(false, ServerError.unknownError,[])
                } else {
                    completionBlock(false, ServerError.connectionError,[])
                }
            }
        }
    }
    
    
    func getRestaurants(city_id:String ,completionBlock: @escaping (_ success: Bool, _ error: ServerError?, _ result:[Restaurant]) -> Void) {
        // url & parameters
        let signInURL = "\(baseURL)/getRestaurants.php"
        let parameters : [String : Any] = [
            "res_id":city_id
        ]
        // build request
        Alamofire.request(signInURL, method: .post, parameters: parameters).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                let jsonResponse = JSON(responseObject.result.value!)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    let serverError = ServerError(json: jsonResponse["error"]) ?? ServerError.unknownError
                    completionBlock(false , serverError,[])
                } else {
                    if let array = jsonResponse.array{
                        let cities = array.map{Restaurant(json:$0)}
                        completionBlock(true , nil,cities)
                    }else{
                        completionBlock(true , nil,[])
                    }
                }
            }
            // Network error request time out or server error with no payload
            if responseObject.result.isFailure {
                let nsError : NSError = responseObject.result.error! as NSError
                print(nsError.localizedDescription)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    completionBlock(false, ServerError.unknownError,[])
                } else {
                    completionBlock(false, ServerError.connectionError,[])
                }
            }
        }
    }
    
    
    //    getOffersById: @Post
    //http://cards.appfirm.tech/getOffersById.php , parameter = res_id
    
    func getOffersBy(id:String ,completionBlock: @escaping (_ success: Bool, _ error: ServerError?, _ result:[Offer]) -> Void) {
        // url & parameters
        let signInURL = "\(baseURL)/getOffersById.php"
        let parameters : [String : Any] = [
            "res_id":id
        ]
        // build request
        Alamofire.request(signInURL, method: .post, parameters: parameters).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                let jsonResponse = JSON(responseObject.result.value!)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    let serverError = ServerError(json: jsonResponse["error"]) ?? ServerError.unknownError
                    completionBlock(false , serverError,[])
                } else {
                    if let array = jsonResponse.array{
                        let cities = array.map{Offer(json:$0)}
                        completionBlock(true , nil,cities)
                    }else{
                        completionBlock(true , nil,[])
                    }
                }
            }
            // Network error request time out or server error with no payload
            if responseObject.result.isFailure {
                let nsError : NSError = responseObject.result.error! as NSError
                print(nsError.localizedDescription)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    completionBlock(false, ServerError.unknownError,[])
                } else {
                    completionBlock(false, ServerError.connectionError,[])
                }
            }
        }
    }
    
    /*
     getHighPriorityRestaurants : @Post
     http://cards.appfirm.tech/getHighPriorityRestaurants.php , parameter = reg_id
     */
    
    func getHighPriorityRestaurants(id:String ,completionBlock: @escaping (_ success: Bool, _ error: ServerError?, _ result:[Restaurant]) -> Void) {
        // url & parameters
        let signInURL = "\(baseURL)/getHighPriorityRestaurants.php"
        let parameters : [String : Any] = [
            "reg_id":id
        ]
        // build request
        Alamofire.request(signInURL, method: .post, parameters: parameters).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                let jsonResponse = JSON(responseObject.result.value!)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    let serverError = ServerError(json: jsonResponse["error"]) ?? ServerError.unknownError
                    completionBlock(false , serverError,[])
                } else {
                    if let array = jsonResponse.array{
                        let cities = array.map{Restaurant(json:$0)}
                        completionBlock(true , nil,cities)
                    }else{
                        completionBlock(true , nil,[])
                    }
                }
            }
            // Network error request time out or server error with no payload
            if responseObject.result.isFailure {
                let nsError : NSError = responseObject.result.error! as NSError
                print(nsError.localizedDescription)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    completionBlock(false, ServerError.unknownError,[])
                } else {
                    completionBlock(false, ServerError.connectionError,[])
                }
            }
        }
    }
   /*
    getoffers: @get
    http://cards.appfirm.tech/getAllOffer.php
    */
    
    func getoffers(completionBlock: @escaping (_ success: Bool, _ error: ServerError?,_ result : [Offer]) -> Void) {
        // url & parameters
        let bottleURL = "\(baseURL)/offers.php"
        
        // build request
        Alamofire.request(bottleURL, method: .get).responseJSON { (responseObject) -> Void in
            print(responseObject)
            if responseObject.result.isSuccess {
                let jsonResponse = JSON(responseObject.result.value!)
                if let code = responseObject.response?.statusCode, code >= 400 {
                    let serverError = ServerError(json: jsonResponse["error"]) ?? ServerError.unknownError
                    completionBlock(false , serverError,[])
                } else {
                    if let array = jsonResponse.array{
                        let cities = array.map{Offer(json:$0)}
                        completionBlock(true , nil,cities)
                    }else{
                        completionBlock(true , nil,[])
                    }
                }
            }
            // Network error request time out or server error with no payload
            if responseObject.result.isFailure {
                if let code = responseObject.response?.statusCode, code >= 400 {
                    completionBlock(false, ServerError.unknownError,[])
                } else {
                    completionBlock(false, ServerError.connectionError,[])
                }
            }
        }
    }
}


/**
 Server error represents custome errors types from back end
 */
struct ServerError {
    
    static let errorCodeConnection = 50
    
    public var errorName:String?
    public var status: Int?
    public var code:Int!
    
    public var type:ErrorType {
        get{
            return ErrorType(rawValue: code) ?? .unknown
        }
    }
    
    /// Server erros codes meaning according to backend
    enum ErrorType:Int {
        case connection = 50
        case unknown = -111
        case authorization = 401
        case userNotActivated = 403
        case emailNotFound = 404
        case invalidUserName = 405
        case noBottleFound = 406
        case alreadyExists = 422
        case socialLoginFailed = -110
        case notRegistred = 102
        case missingInputData = 104
        case expiredVerifyCode = 107
        case invalidVerifyCode = 108
        case userNotFound = 109
        
        /// Handle generic error messages
        /// **Warning:** it is not localized string
        var errorMessage:String {
            switch(self) {
            case .unknown:
                return "ERROR_UNKNOWN".localized
            case .connection:
                return "لا يوجد اتصال بالانترنت"
            case .authorization:
                return "ERROR_NOT_AUTHORIZED".localized
            case .alreadyExists:
                return "ERROR_SIGNUP_EMAIL_EXISTS".localized
            case .emailNotFound:
                return "ERROR_EMAIL_NOT_EXISTS".localized
            case .notRegistred:
                return "ERROR_SIGNIN_WRONG_CREDIST".localized
            case .missingInputData:
                return "ERROR_MISSING_INPUT_DATA".localized
            case .expiredVerifyCode:
                return "ERROR_EXPIRED_VERIFY_CODE".localized
            case .invalidVerifyCode:
                return "ERROR_INVALID_VERIFY_CODE".localized
            case .userNotFound:
                return "ERROR_RESET_WRONG_EMAIL".localized
            case .userNotActivated:
                return "ERROR_UNACTIVATED_USER".localized
            case .invalidUserName:
                return "ERROR_INVALID_USERNAME".localized
            case .noBottleFound:
                return "ERROR_BOTTLE_NOT_FOUND".localized
                
            default:
                return "ERROR_UNKNOWN".localized
            }
        }
    }
    
    public static var connectionError: ServerError{
        get {
            var error = ServerError()
            error.code = ErrorType.connection.rawValue
            error.errorName = ErrorType.connection.errorMessage
            return error
        }
    }
    
    public static var unknownError: ServerError{
        get {
            var error = ServerError()
            error.code = ErrorType.unknown.rawValue
            return error
        }
    }
    
    public static var socialLoginError: ServerError{
        get {
            var error = ServerError()
            error.code = ErrorType.socialLoginFailed.rawValue
            return error
        }
    }
    
    public init() {
    }
    
    public init?(json: JSON) {
        guard let errorCode = json["statusCode"].int else {
            return nil
        }
        code = errorCode
        if let errorString = json["message"].string{ errorName = errorString}
        if let statusCode = json["statusCode"].int{ status = statusCode}
    }
}


