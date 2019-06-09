//
//  Actions.swift
//  BrainSocket Code base
//
//  Created by BrainSocket on 7/5/17.
//  Copyright © 2017 BrainSocket. All rights reserved.
//

import Foundation
import StoreKit

/**
Repeated and generic actions to be excuted from any context of the app such as show alert
 */
class Action: NSObject {
    class func execute() {}

}

//class ActionLogout:Action {
//    override class func execute() {
//        let cancelButton = UIAlertAction(title: "CANCEL".localized, style: .cancel, handler: nil)
//        let okButton = UIAlertAction(title: "SETTINGS_USER_LOGOUT".localized, style: .default, handler: {
//            (action) in
//            //clear user
//            ApiManager.shared.userLogout(email: "", password: "", completionBlock: { (_, _, _) in})
//            DataStore.shared.logout()
//            ActionShowStart.execute()
//        })
//        let alert = UIAlertController(title: "SETTINGS_USER_LOGOUT".localized, message: "SETTINGS_USER_LOGOUT_CONFIRM_MSG".localized, preferredStyle: .alert)
//        alert.addAction(okButton)
//        alert.addAction(cancelButton)
//        if let controller = UIApplication.visibleViewController() {
//            controller.present(alert, animated: true, completion: nil)
//
//        }
//    }
//}
//
class ActionShowAboutUs:Action{
    override class func execute(){
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        
        
        UIApplication.visibleViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}


class ActionShowOffers:Action{
    override class func execute(){
                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "OffersViewController") as! OffersViewController
        
        
                UIApplication.visibleViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}

//CategoriesSubscriptionViewController
