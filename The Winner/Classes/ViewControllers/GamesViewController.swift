//
//  GamesViewController.swift
//  The Winner
//
//  Created by Nour  on 6/17/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class GamesViewController: AbstractController {
    
    // tarneeb 41
    @IBOutlet weak var tarneeb41View: UIView!
    @IBOutlet weak var tarneeb41PlayersView: UIView!
    @IBOutlet weak var tarneeb41FirstPlayerTF: XUITextField!
    @IBOutlet weak var tarneeb41SecondPlayerTF: XUITextField!
    @IBOutlet weak var tarneeb41ThirdPlayerTF: XUITextField!
    @IBOutlet weak var tarneeb41FForthPlayerTF: XUITextField!
    
    // tarneeb 61
    @IBOutlet weak var tarneeb61View: UIView!
    @IBOutlet weak var tarneeb61PlayersView: UIView!
    @IBOutlet weak var tarneeb61FirstPlayerTF: XUITextField!
    @IBOutlet weak var tarneeb61SecondPlayerTF: XUITextField!
    
    // Leckha
    @IBOutlet weak var lekhaView: UIView!
    @IBOutlet weak var lekhaPlayersView: UIView!
    @IBOutlet weak var lekhaFirstPlayerTF: XUITextField!
    @IBOutlet weak var lekhaSecondPlayerTF: XUITextField!
    @IBOutlet weak var lekhaThirdPlayerTF: XUITextField!
    @IBOutlet weak var lekhaForthPlayerTF: XUITextField!
    
    // concan
    @IBOutlet weak var concanView: UIView!
    @IBOutlet weak var concanPlayersView: UIView!
    @IBOutlet weak var concanNumberOfPlayerView: UIView!
    @IBOutlet weak var concanSegmentController: UISegmentedControl!
    @IBOutlet weak var concanFirstPlayerTF: XUITextField!
    @IBOutlet weak var concanSecondPlayerTF: XUITextField!
    @IBOutlet weak var concanThirdPlayerTF: XUITextField!
    @IBOutlet weak var concanForthPlayerTF: XUITextField!
    
    
    // complex
    @IBOutlet weak var complexView: UIView!
    @IBOutlet weak var complexGameTypeView: UIView!
    @IBOutlet weak var complexNormalPlayersView: UIView!
    @IBOutlet weak var complexGroupPlayersView: UIView!
    @IBOutlet weak var complexGameTypeSG: UISegmentedControl!
    
    @IBOutlet weak var complexFirtsPlayerTF: XUITextField!
    @IBOutlet weak var complexSecondPlayerTF: XUITextField!
    @IBOutlet weak var complexThirdPlayerTF: XUITextField!
    @IBOutlet weak var complexForthPlayerTF: XUITextField!
    @IBOutlet weak var complexTeamNameTF: XUITextField!
    // trex
    @IBOutlet weak var trexView: UIView!
    @IBOutlet weak var trexGameTypeView: UIView!
    @IBOutlet weak var trexNormalPlayersView: UIView!
    @IBOutlet weak var trexGroupPlayersView: UIView!
    @IBOutlet weak var trexGameTypeSG: UISegmentedControl!
    
    @IBOutlet weak var trexFirtsPlayerTF: XUITextField!
    @IBOutlet weak var trexSecondPlayerTF: XUITextField!
    @IBOutlet weak var trexThirdPlayerTF: XUITextField!
    @IBOutlet weak var trexForthPlayerTF: XUITextField!
    @IBOutlet weak var trexTeamNameTF: XUITextField!
    @IBOutlet weak var trexTeamGameTypeSG: UISegmentedControl!
    
    var playersNames:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavBarTitle(title: "الالعاب")
        self.showNavAboutButton = true
        self.tabBarController?.hidesBottomBarWhenPushed = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        self.showTabBar()
    }
    
    
    override func closeButtonAction(_ sender: AnyObject) {
        self.hideLekha(UITapGestureRecognizer())
        self.hideConcan(UITapGestureRecognizer())
        self.hideTrexView(UITapGestureRecognizer())
        self.hideTarneeb41(UITapGestureRecognizer())
        self.hideTarneeb61(UITapGestureRecognizer())
        self.hideComplexView(UITapGestureRecognizer())
        self.showNavCloseButton = false
    }
    
    // tarneeb 41
    
    @IBAction func showTareneeb41View(_ sender: UIButton) {
        self.tarneeb41View.isHidden = false
        self.tarneeb41PlayersView.animateIn(mode: .animateInFromBottom, delay: 0.2)
        self.showNavCloseButton = true
    }
    
    func validateTarneeb41()->Bool{
        if let firstPlayer = tarneeb41FirstPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = tarneeb41SecondPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        if let firstPlayer = tarneeb41ThirdPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = tarneeb41FForthPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        return true
    }
    
    @IBAction func handleTarneeb41Game(_ sender: UIButton) {
        playersNames.removeAll()
        if validateTarneeb41(){
            hideTarneeb41(UITapGestureRecognizer())
            DataStore.shared.currentGame = Game(type: .tarneb41, numberOfPlayers: playersNames.count)
            DataStore.shared.currentGame?.setPlayersName(playersName: playersNames)
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TarneebViewViewController") as! TarneebViewViewController
//            self.navigationController?.pushViewController(vc, animated: true)
            let nav = UINavigationController(rootViewController: vc)
            //            self.navigationController?.pushViewController(vc, animated: true)
            self.present(nav, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func hideTarneeb41(_ sender: UITapGestureRecognizer) {
        self.tarneeb41View.isHidden = true
        self.tarneeb41FirstPlayerTF.text = nil
        self.tarneeb41SecondPlayerTF.text = nil
        self.tarneeb41ThirdPlayerTF.text = nil
        self.tarneeb41FForthPlayerTF.text = nil
        self.view.endEditing(true)
        self.showNavCloseButton = false
    }
    
    func validateTarneeb61()->Bool{
        
        if let firstPlayer = tarneeb61FirstPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = tarneeb61SecondPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }

        return true
    }
    
    @IBAction func hideTarneeb61(_ sender: UITapGestureRecognizer) {
        self.tarneeb61View.isHidden = true
        self.tarneeb61FirstPlayerTF.text = nil
        self.tarneeb61SecondPlayerTF.text = nil
        self.view.endEditing(true)
        self.showNavCloseButton = false
    }
    
    @IBAction func showTarneeb61View(_ sender: UIButton) {
        self.tarneeb61View.isHidden = false
        self.tarneeb61PlayersView.animateIn(mode: .animateInFromBottom, delay: 0.2)
        self.showNavCloseButton = true
    }
    
    @IBAction func handelTarneeb61Game(_ sender: UIButton) {
        playersNames.removeAll()
        if validateTarneeb61(){
            hideTarneeb61(UITapGestureRecognizer())
            DataStore.shared.currentGame = Game(type: .tarneb61, numberOfPlayers: playersNames.count)
            DataStore.shared.currentGame?.setPlayersName(playersName: playersNames)
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TarneebViewViewController") as! TarneebViewViewController
//            self.navigationController?.pushViewController(vc, animated: true)
            let nav = UINavigationController(rootViewController: vc)
            //            self.navigationController?.pushViewController(vc, animated: true)
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    
    // lekha
    func validateLekha()-> Bool{
        
        if let firstPlayer = lekhaFirstPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = lekhaSecondPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        if let firstPlayer = lekhaThirdPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = lekhaForthPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        return true
    }

    @IBAction func showLekhaView(_ sender: UIButton) {
        self.lekhaView.isHidden = false
        self.lekhaPlayersView.animateIn(mode: .animateInFromBottom, delay: 0.2)
        self.showNavCloseButton = true
    }
    
    @IBAction func hideLekha(_ sender: UITapGestureRecognizer) {
        self.lekhaView.isHidden = true
        self.lekhaFirstPlayerTF.text = nil
        self.lekhaSecondPlayerTF.text = nil
        self.lekhaThirdPlayerTF.text = nil
        self.lekhaForthPlayerTF.text = nil
        self.view.endEditing(true)
        self.showNavCloseButton = false
    }
    
    @IBAction func handelLekhaGame(_ sender: UIButton) {
        playersNames.removeAll()
        if validateLekha(){
            hideLekha(UITapGestureRecognizer())
            DataStore.shared.currentGame = Game(type: .lekha, numberOfPlayers: playersNames.count)
            DataStore.shared.currentGame?.setPlayersName(playersName: playersNames)
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LekhaViewController") as! LekhaViewController
//            self.navigationController?.pushViewController(vc, animated: true)
            let nav = UINavigationController(rootViewController: vc)
            //            self.navigationController?.pushViewController(vc, animated: true)
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    
    
    // concan
    
    func validateConcan()-> Bool{
        
        if let firstPlayer = concanFirstPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = concanSecondPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        if DataStore.shared.currentGame!.numberOfPlayers > 2{
            if let firstPlayer = concanThirdPlayerTF.text , !firstPlayer.isEmpty{
                playersNames.append(firstPlayer)
            }else{
                self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
                return false
            }
            
            if DataStore.shared.currentGame!.numberOfPlayers > 3{
                if let firstPlayer = concanForthPlayerTF.text , !firstPlayer.isEmpty{
                    playersNames.append(firstPlayer)
                }else{
                    self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
                    return false
                }
            }
        }
        return true
    }
    
    @IBAction func showConcanView(_ sender: UIButton) {
        self.concanView.isHidden = false
        self.concanPlayersView.isHidden = true
        self.concanNumberOfPlayerView.isHidden = false
        self.concanNumberOfPlayerView.animateIn(mode: .animateInFromBottom, delay: 0.2)
        self.showNavCloseButton = true
        
    }
    
    @IBAction func hideConcan(_ sender: UITapGestureRecognizer) {
        self.concanView.isHidden = true
        self.concanFirstPlayerTF.text = nil
        self.concanSecondPlayerTF.text = nil
        self.concanThirdPlayerTF.text = nil
        self.concanForthPlayerTF.text = nil
        self.concanSegmentController.selectedSegmentIndex = -1
        self.view.endEditing(true)
        self.showNavCloseButton = false
    }
    
    @IBAction func setConcanNumberOfPlayer(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            DataStore.shared.currentGame = Game(type: .concan, numberOfPlayers: 4)
            self.concanThirdPlayerTF.isHidden = false
            self.concanForthPlayerTF.isHidden = false
        }else if sender.selectedSegmentIndex == 1{
                DataStore.shared.currentGame = Game(type: .concan, numberOfPlayers: 3)
                self.concanThirdPlayerTF.isHidden = false
                self.concanForthPlayerTF.isHidden = true
        }else if sender.selectedSegmentIndex == 2{
                DataStore.shared.currentGame = Game(type: .concan, numberOfPlayers: 2)
                self.concanThirdPlayerTF.isHidden = true
                self.concanForthPlayerTF.isHidden = true
        }
    }
    
    @IBAction func handelConcanNumberOfplayer(_ sender: UIButton) {
        if concanSegmentController.selectedSegmentIndex == -1{
            self.showMessage(message: "الرجاء اختيار عدد اللاعبين", type: .error)
        }else{
            self.concanNumberOfPlayerView.isHidden = true
            self.concanPlayersView.isHidden = false
            self.concanPlayersView.animateIn(mode: .animateInFromLeft, delay: 0.2)
        }
    }
    
    @IBAction func handelConcanGame(_ sender: UIButton) {
        playersNames.removeAll()
        if validateConcan(){
            hideConcan(UITapGestureRecognizer())
            DataStore.shared.currentGame = Game(type: .concan, numberOfPlayers: playersNames.count)
            DataStore.shared.currentGame?.setPlayersName(playersName: playersNames)
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ConcanViewController") as! ConcanViewController
//            self.navigationController?.pushViewController(vc, animated: true)
            let nav = UINavigationController(rootViewController: vc)
            //            self.navigationController?.pushViewController(vc, animated: true)
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    
    
    // complex
  
    func validateComplexGroup()-> Bool{
        
        if let firstPlayer = complexTeamNameTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال اسم الفريق", type: .error)
            return false
        }
 
        return true
    }
    
    func validateComplexNormal()-> Bool{
        
        if let firstPlayer = complexFirtsPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = complexSecondPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = complexThirdPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
                self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
                return false
        }


        if let firstPlayer = complexForthPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        
        return true
    }
    
    @IBAction func showComplexView(_ sender: UIButton) {
        self.complexView.isHidden = false
        self.complexGameTypeView.isHidden = false
        self.complexGroupPlayersView.isHidden = true
        self.complexNormalPlayersView.isHidden = true
        self.complexGameTypeView.animateIn(mode: .animateInFromLeft, delay: 0.2)
        self.showNavCloseButton = true
    }
    
    @IBAction func hideComplexView(_ sender: UITapGestureRecognizer) {
        self.complexView.isHidden = true
        self.complexFirtsPlayerTF.text = nil
        self.complexSecondPlayerTF.text = nil
        self.complexThirdPlayerTF.text = nil
        self.complexForthPlayerTF.text = nil
        self.complexTeamNameTF.text = nil
        self.complexGameTypeSG.selectedSegmentIndex = -1
        self.view.endEditing(true)
        self.showNavCloseButton = false
    }
    
    @IBAction func setComplexGameType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            DataStore.shared.currentGame = Game(type: .trexComplex, numberOfPlayers: 1)
            
        }else if sender.selectedSegmentIndex == 1{
            DataStore.shared.currentGame = Game(type: .trexComplex, numberOfPlayers: 4)
            
        }
    }
    
    @IBAction func handelComplexGameType(_ sender: UIButton) {
        if complexGameTypeSG.selectedSegmentIndex == -1{
            self.showMessage(message: "الرجاء اختيار نوع اللعبة", type: .error)
        }else if complexGameTypeSG.selectedSegmentIndex == 0{
            self.complexGameTypeView.isHidden = true
            self.complexGroupPlayersView.isHidden = false
            self.complexGroupPlayersView.animateIn(mode: .animateInFromLeft, delay: 0.2)
        }else if complexGameTypeSG.selectedSegmentIndex == 1{
            self.complexGameTypeView.isHidden = true
            self.complexNormalPlayersView.isHidden = false
            self.complexNormalPlayersView.animateIn(mode: .animateInFromLeft, delay: 0.2)
        }
    }
    
    @IBAction func handelComplexNormalGame(_ sender: UIButton) {
        playersNames.removeAll()
        if validateComplexNormal(){
            hideComplexView(UITapGestureRecognizer())
            DataStore.shared.currentGame = Game(type: .trexComplex, numberOfPlayers: playersNames.count)
            DataStore.shared.currentGame?.setPlayersName(playersName: playersNames)
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ComplexNormalViewController") as! ComplexNormalViewController
//            self.navigationController?.pushViewController(vc, animated: true)
            let nav = UINavigationController(rootViewController: vc)
            //            self.navigationController?.pushViewController(vc, animated: true)
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    @IBAction func handelComplexGroupGame(_ sender: UIButton) {
        playersNames.removeAll()
        if validateComplexGroup(){
            hideComplexView(UITapGestureRecognizer())
            DataStore.shared.currentGame = Game(type: .trexComplex, numberOfPlayers: playersNames.count)
            DataStore.shared.currentGame?.setPlayersName(playersName: playersNames)
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ComplexGroupViewController") as! ComplexGroupViewController
//            self.navigationController?.pushViewController(vc, animated: true)
            let nav = UINavigationController(rootViewController: vc)
            //            self.navigationController?.pushViewController(vc, animated: true)
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    // trex
    
    func validateTrexGroup()-> Bool{
        
        if let firstPlayer = trexTeamNameTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال اسم الفريق", type: .error)
            return false
        }
        
        if trexTeamGameTypeSG.selectedSegmentIndex != -1{
            
        }else{
            self.showMessage(message: "الرجاء اختيار نوع اللعب", type: .error)
            return false
        }
        
        return true
    }
    
    func validateTrexNormal()-> Bool{
        
        if let firstPlayer = trexFirtsPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = trexSecondPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        if let firstPlayer = trexThirdPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        
        if let firstPlayer = trexForthPlayerTF.text , !firstPlayer.isEmpty{
            playersNames.append(firstPlayer)
        }else{
            self.showMessage(message: "الرجاء ادخال كافة اللاعبين", type: .error)
            return false
        }
        
        
        return true
    }
    
    @IBAction func showTrexView(_ sender: UIButton) {
        self.trexView.isHidden = false
        self.trexGameTypeView.isHidden = false
        self.trexGroupPlayersView.isHidden = true
        self.trexNormalPlayersView.isHidden = true
        self.trexGameTypeView.animateIn(mode: .animateInFromLeft, delay: 0.2)
        self.showNavCloseButton = true
    }
    
    @IBAction func hideTrexView(_ sender: UITapGestureRecognizer) {
        self.trexView.isHidden = true
        self.trexFirtsPlayerTF.text = nil
        self.trexSecondPlayerTF.text = nil
        self.trexThirdPlayerTF.text = nil
        self.trexForthPlayerTF.text = nil
        self.trexTeamNameTF.text = nil
        self.trexGameTypeSG.selectedSegmentIndex = -1
        self.trexTeamGameTypeSG.selectedSegmentIndex = -1
        self.view.endEditing(true)
        self.showNavCloseButton = false
    }
    
    @IBAction func setTrexGameType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            DataStore.shared.currentGame = Game(type: .trex, numberOfPlayers: 1)
            
        }else if sender.selectedSegmentIndex == 1{
            DataStore.shared.currentGame = Game(type: .trex, numberOfPlayers: 4)
            
        }
    }
    
    @IBAction func handelTrexGameType(_ sender: UIButton) {
        if trexGameTypeSG.selectedSegmentIndex == -1{
            self.showMessage(message: "الرجاء اختيار نوع اللعبة", type: .error)
        }else if trexGameTypeSG.selectedSegmentIndex == 0{
            self.trexGameTypeView.isHidden = true
            self.trexGroupPlayersView.isHidden = false
            self.trexGroupPlayersView.animateIn(mode: .animateInFromLeft, delay: 0.2)
        }else if trexGameTypeSG.selectedSegmentIndex == 1{
            self.trexGameTypeView.isHidden = true
            self.trexNormalPlayersView.isHidden = false
            self.trexNormalPlayersView.animateIn(mode: .animateInFromLeft, delay: 0.2)
        }
    }
    
    @IBAction func handelTrexNormalGame(_ sender: UIButton) {
        playersNames.removeAll()
        if validateTrexNormal(){
            hideTrexView(UITapGestureRecognizer())
            DataStore.shared.currentGame = Game(type: .trex, numberOfPlayers: playersNames.count)
            DataStore.shared.currentGame?.setPlayersName(playersName: playersNames)
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TrexNormalViewController") as! TrexNormalViewController
            let nav = UINavigationController(rootViewController: vc)
            //            self.navigationController?.pushViewController(vc, animated: true)
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    @IBAction func setTrexTeamType(_ sender: UISegmentedControl) {
        trexTeamGameTypeSG.selectedSegmentIndex = sender.selectedSegmentIndex
        if sender.selectedSegmentIndex == 0{
            DataStore.shared.currentGame = Game(type: .trexGroupNormal, numberOfPlayers: 1)
            
        }else{
            DataStore.shared.currentGame = Game(type: .trexGroupDouble, numberOfPlayers: 1)
        }
    }
    
    
    @IBAction func handelTrexGroupGame(_ sender: UIButton) {
        playersNames.removeAll()
        if validateTrexGroup(){
            hideTrexView(UITapGestureRecognizer())
            DataStore.shared.currentGame?.setPlayersName(playersName: playersNames)
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TrexGroupViewController") as! TrexGroupViewController
            let nav = UINavigationController(rootViewController: vc)
            //            self.navigationController?.pushViewController(vc, animated: true)
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("pressed")
        return true
    }
}
