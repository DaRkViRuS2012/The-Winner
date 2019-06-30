//
//  Game.swift
//  The Winner
//
//  Created by Nour  on 6/17/19.
//  Copyright © 2019 Nour . All rights reserved.
//

import Foundation

enum GameType{
    case tarneb41
    case tarneb61
    case concan
    case lekha
    case trex
    case trexGroupNormal
    case trexGroupDouble
    case trexComplex
}


class Game{
    
    public var type:GameType
    public var numberOfPlayers:Int
    public var players:[Player] = []
    public var laps:[Lap] = []
    
    init(type:GameType,numberOfPlayers:Int) {
        self.type = type
        self.numberOfPlayers = numberOfPlayers
    }

    public func setPlayersName(playersName:[String]){
        for name in playersName{
            let player  = Player(name: name)
            players.append(player)
        }
    }
}

class Lap{
    public var players:[Player] = []
    
    public func setPlayersName(playersName:[String]){
        for name in playersName{
            let player  = Player(name: name)
            players.append(player)
        }
    }
}


class Player{
    public var name:String
    public var result:Int
    
    init(name:String) {
        self.name = name
        self.result = 0
    }

    
    func setResult(res:Int){
        self.result += res
    }
    
    func getResult()-> Int{
        return result
    }
    
}
