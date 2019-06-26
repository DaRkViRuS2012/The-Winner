//
//  TarneebViewViewController.swift
//  The Winner
//
//  Created by Nour  on 6/18/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import UIKit

class TarneebViewViewController: AbstractController {

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var firstPlayerNameLabel:UILabel!
    @IBOutlet weak var secondPlayerNameLabel:UILabel!
    @IBOutlet weak var thirdPlayerNameLabel:UILabel!
    @IBOutlet weak var forthPlayerNameLabel:UILabel!
    @IBOutlet weak var firstPlayerResultLabel:UILabel!
    @IBOutlet weak var secondPlayerResultLabel:UILabel!
    @IBOutlet weak var thirdPlayerResultLabel:UILabel!
    @IBOutlet weak var forthPlayerResultLabel:UILabel!
    
    @IBOutlet weak var tarneeb41ResultView: UIView!
    @IBOutlet weak var tarneeb41ContentView: UIView!
    @IBOutlet weak var tarneeb41FPTF: XUITextField!
    @IBOutlet weak var tqrneeb41SPTF: XUITextField!
    @IBOutlet weak var tarneeb41TPTF: XUITextField!
    @IBOutlet weak var tarneeb41FTPTF: XUITextField!
    @IBOutlet weak var tarneeb41FPSC: UISegmentedControl!
    @IBOutlet weak var tarneeb41SPSC: UISegmentedControl!
    @IBOutlet weak var tarneeb41TPSC: UISegmentedControl!
    @IBOutlet weak var tarneeb41FTPSC: UISegmentedControl!
    
    @IBOutlet weak var tarneeb61View: UIView!
    @IBOutlet weak var tarneeb61ContentView: UIView!
    @IBOutlet weak var firstTeamButton: XUIButton!
    @IBOutlet weak var secondTeemButton: XUIButton!
    @IBOutlet weak var tarneeb61ResultTF: XUITextField!
    
    var selectedButton:XUIButton?
    
    var laps:[Lap] = []
    let cellId = "Tarneeb41Cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showNavBackButton  = true
        if let type = DataStore.shared.currentGame?.type , type == .tarneb41{
            self.setNavBarTitle(title: "طرنيب 41")
        }else{
            self.setNavBarTitle(title: "طرنيب 61")
        }
        let nib = UINib(nibName: cellId, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
        self.tabBarController?.hidesBottomBarWhenPushed = true
        setResult()
        firstPlayerNameLabel.text = DataStore.shared.currentGame?.players[0].name
        secondPlayerNameLabel.text = DataStore.shared.currentGame?.players[1].name
        if let type = DataStore.shared.currentGame?.type , type == .tarneb41{
            thirdPlayerNameLabel.text = DataStore.shared.currentGame?.players[2].name
            forthPlayerNameLabel.text =  DataStore.shared.currentGame?.players[3].name
        }else{
            thirdPlayerNameLabel.isHidden = true
            forthPlayerNameLabel.isHidden = true
        }
    }
    
    
    func setResult(){
        firstPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[0].getResult() ?? 0)"
        secondPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[1].getResult() ?? 0)"
        if let type = DataStore.shared.currentGame?.type , type == .tarneb41{
            thirdPlayerResultLabel.text = "\(DataStore.shared.currentGame?.players[2].getResult() ?? 0)"
            forthPlayerResultLabel.text =  "\(DataStore.shared.currentGame?.players[3].getResult() ?? 0)"
        }else{
            thirdPlayerResultLabel.isHidden = true
            forthPlayerResultLabel.isHidden = true
        }
    }
    
    func validateTarneeb41Lap()->Bool{
        let lap = Lap()
        lap.players = [Player(name:""),Player(name:""),Player(name:""),Player(name:"")]
        if let firstPlayer = tarneeb41FPTF.text , !firstPlayer.isEmpty,let resut = Int(firstPlayer){
            lap.players[0].result = (resut >= 5) ? resut * 2 : resut
        }else{
            self.showMessage(message:"الرجاء ادخال كافة النتائج", type: .error)
            return false
        }
        
        if let firstPlayer = tqrneeb41SPTF.text , !firstPlayer.isEmpty,let resut = Int(firstPlayer){
            lap.players[1].result = resut >= 5 ? resut * 2 : resut
            
        }else{
            self.showMessage(message: "الرجاء ادخال كافة النتائج", type: .error)
            return false
        }
        
        if let firstPlayer = tarneeb41TPTF.text , !firstPlayer.isEmpty,let resut = Int(firstPlayer){
            lap.players[2].result = resut >= 5 ? resut * 2 : resut
        }else{
            self.showMessage(message: "الرجاء ادخال كافة النتائج", type: .error)
            return false
        }
        
        if let firstPlayer = tarneeb41FTPTF.text , !firstPlayer.isEmpty,let resut = Int(firstPlayer){
            lap.players[3].result = resut >= 5 ? resut * 2 : resut
            
        }else{
            self.showMessage(message: "الرجاء ادخال كافة النتائج", type: .error)
            return false
        }
        
        
        if tarneeb41FPSC.selectedSegmentIndex != -1{
           
        }else{
            self.showMessage(message:"الرجاء اختيار الرابح والخاسر لجميع اللاعبين", type: .error)
            return false
        }
        
        if tarneeb41SPSC.selectedSegmentIndex  != -1{
          
        }else{
            self.showMessage(message:"الرجاء اختيار الرابح والخاسر لجميع اللاعبين", type: .error)
            return false
        }
        
        
        if tarneeb41TPSC.selectedSegmentIndex != -1{
            
        }else{
            self.showMessage(message:"الرجاء اختيار الرابح والخاسر لجميع اللاعبين", type: .error)
            return false
        }
        
        if  tarneeb41FTPSC.selectedSegmentIndex != -1{
           
        }else{
            self.showMessage(message:"الرجاء اختيار الرابح والخاسر لجميع اللاعبين", type: .error)
            return false
        }
        
        if tarneeb41FPSC.selectedSegmentIndex == 0{
            DataStore.shared.currentGame?.players[0].setResult(res: -lap.players[0].result)
        }else{
            DataStore.shared.currentGame?.players[0].setResult(res: lap.players[0].result)
        }
        
        if tarneeb41SPSC.selectedSegmentIndex == 0{
            DataStore.shared.currentGame?.players[1].setResult(res: -lap.players[1].result)
        }else{
            DataStore.shared.currentGame?.players[1].setResult(res: lap.players[1].result)
        }
        
        if tarneeb41TPSC.selectedSegmentIndex == 0{
            DataStore.shared.currentGame?.players[2].setResult(res: -lap.players[2].result)
        }else{
            DataStore.shared.currentGame?.players[2].setResult(res: lap.players[2].result)
        }
        
        if tarneeb41FTPSC.selectedSegmentIndex == 0{
            DataStore.shared.currentGame?.players[3].setResult(res: -lap.players[3].result)
        }else{
            DataStore.shared.currentGame?.players[3].setResult(res: lap.players[3].result)
        }
        
        self.laps.append(lap)
        setResult()
        collectionView.reloadData()
        
        return true
    }
    
    func showTarneeb41(){
        self.tarneeb41ResultView.isHidden = false
        self.tarneeb41ContentView.isHidden = false
        self.tarneeb41ContentView.animateIn(mode: .animateInFromBottom, delay: 0.2)
    }
    
    func hideTarneeb41(){
        self.tarneeb41ResultView.isHidden = true
        tarneeb41FPTF.text = nil
        tqrneeb41SPTF.text = nil
        tarneeb41TPTF.text = nil
        tarneeb41FTPTF.text = nil
        tarneeb41FPSC.selectedSegmentIndex = -1
        tarneeb41SPSC.selectedSegmentIndex = -1
        tarneeb41TPSC.selectedSegmentIndex = -1
        tarneeb41FTPSC.selectedSegmentIndex = -1
        self.view.endEditing(true)
    }

    @IBAction func handelTarneeb41Lap(_ sender: UIButton) {
        if validateTarneeb41Lap(){
            self.hideTarneeb41()
        }
    }
    
    @IBAction func hideTarneeb41View(_ sender: UITapGestureRecognizer) {
       self.hideTarneeb41()
    }
    
    
    // tarneeb 61
    
    func validateTarneeb61Lap()->Bool{
        let lap = Lap()
        lap.players = [Player(name:""),Player(name:""),Player(name:""),Player(name:"")]
        if let firstPlayer = tarneeb41FPTF.text , !firstPlayer.isEmpty,let resut = Int(firstPlayer){
            lap.players[0].result = (resut >= 5) ? resut * 2 : resut
        }else{
            self.showMessage(message:"الرجاء ادخال كافة النتائج", type: .error)
            return false
        }
        
        if let firstPlayer = tqrneeb41SPTF.text , !firstPlayer.isEmpty,let resut = Int(firstPlayer){
            lap.players[1].result = resut >= 5 ? resut * 2 : resut
            
        }else{
            self.showMessage(message: "الرجاء ادخال كافة النتائج", type: .error)
            return false
        }
        
        if let firstPlayer = tarneeb41TPTF.text , !firstPlayer.isEmpty,let resut = Int(firstPlayer){
            lap.players[2].result = resut >= 5 ? resut * 2 : resut
        }else{
            self.showMessage(message: "الرجاء ادخال كافة النتائج", type: .error)
            return false
        }
        
        if let firstPlayer = tarneeb41FTPTF.text , !firstPlayer.isEmpty,let resut = Int(firstPlayer){
            lap.players[3].result = resut >= 5 ? resut * 2 : resut
            
        }else{
            self.showMessage(message: "الرجاء ادخال كافة النتائج", type: .error)
            return false
        }
        
        
        if tarneeb41FPSC.selectedSegmentIndex != -1{
            
        }else{
            self.showMessage(message:"الرجاء اختيار الرابح والخاسر لجميع اللاعبين", type: .error)
            return false
        }
        
        if tarneeb41SPSC.selectedSegmentIndex  != -1{
            
        }else{
            self.showMessage(message:"الرجاء اختيار الرابح والخاسر لجميع اللاعبين", type: .error)
            return false
        }
        
        
        if tarneeb41TPSC.selectedSegmentIndex != -1{
            
        }else{
            self.showMessage(message:"الرجاء اختيار الرابح والخاسر لجميع اللاعبين", type: .error)
            return false
        }
        
        if  tarneeb41FTPSC.selectedSegmentIndex != -1{
            
        }else{
            self.showMessage(message:"الرجاء اختيار الرابح والخاسر لجميع اللاعبين", type: .error)
            return false
        }
        
        if tarneeb41FPSC.selectedSegmentIndex == 0{
            DataStore.shared.currentGame?.players[0].setResult(res: -lap.players[0].result)
        }else{
            DataStore.shared.currentGame?.players[0].setResult(res: lap.players[0].result)
        }
        
        if tarneeb41SPSC.selectedSegmentIndex == 0{
            DataStore.shared.currentGame?.players[1].setResult(res: -lap.players[1].result)
        }else{
            DataStore.shared.currentGame?.players[1].setResult(res: lap.players[1].result)
        }
        
        if tarneeb41TPSC.selectedSegmentIndex == 0{
            DataStore.shared.currentGame?.players[2].setResult(res: -lap.players[2].result)
        }else{
            DataStore.shared.currentGame?.players[2].setResult(res: lap.players[2].result)
        }
        
        if tarneeb41FTPSC.selectedSegmentIndex == 0{
            DataStore.shared.currentGame?.players[3].setResult(res: -lap.players[3].result)
        }else{
            DataStore.shared.currentGame?.players[3].setResult(res: lap.players[3].result)
        }
        
        self.laps.append(lap)
        setResult()
        collectionView.reloadData()
        
        return true
    }
    
    func showTarneeb61(){
        self.tarneeb61View.isHidden = false
        self.tarneeb61ContentView.isHidden = false
        self.tarneeb61ContentView.animateIn(mode: .animateInFromBottom, delay: 0.2)
    }
    
    func hideTarneeb61(){
        self.tarneeb61View.isHidden = true
        tarneeb61ResultTF.text = nil
        selectedButton?.isSelected = false
        self.view.endEditing(true)
    }
    
    @IBAction func handelTarneeb61Lap(_ sender: UIButton) {
        if validateTarneeb61Lap(){
            self.hideTarneeb61()
        }
    }
    
    @IBAction func hideTarneeb61View(_ sender: UITapGestureRecognizer) {
        self.hideTarneeb61()
    }
    
    @IBAction func setFirstTeam(_ sender: XUIButton) {
        sender.isSelected = true
        secondTeemButton.isSelected = false
    }
    
    @IBAction func setSecondTeam(_ sender: XUIButton) {
        sender.isSelected = true
        firstTeamButton.isSelected = false
    }
    @IBAction func selectNumber(_ sender: XUIButton) {
        selectedButton?.isSelected = false
        selectedButton = sender
        selectedButton?.primary = true
        selectedButton?.isSelected = true
    }
    
    @IBAction func set7(_ sender: XUIButton) {
        sender.isSelected = true
    }
}

extension TarneebViewViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return laps.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! Tarneeb41Cell
        if indexPath.item < laps.count{
            cell.isUserInteractionEnabled = false
            cell.lap = self.laps[indexPath.item]
            cell.alpha = 0.5
        }else{
          cell.isUserInteractionEnabled = true
          cell.alpha = 1
        }
        cell.delegate = self
        return cell
    }
}

extension TarneebViewViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 16, height: 95)
    }
}


extension TarneebViewViewController:Tarneeb41Delegate{
    func addNewLap(firstPlayer: Int, secondPlayer: Int, thirdPlayer: Int, forthPlayer: Int) {
        
        if let type = DataStore.shared.currentGame?.type , type == .tarneb41{
            self.showTarneeb41()
        }else{
            showTarneeb61()
        }
    }
}
