//
//  Character.swift
//  FightGame
//
//  Created by Alex Cuello ortiz on 27/4/16.
//  Copyright © 2016 None. All rights reserved.
//

import Foundation


class Character {
    private var _HP:Int
    private var _attackPower:Int
    private var _name:String
    
    
    var HP:Int { return _HP }
    var attackPower:Int { return _attackPower }
    var name:String { return _name }
    
    init(Health hp:Int, AttackPower ap: Int, Name name:String){
        self._HP = hp
        self._attackPower = ap
        self._name = name
    }
    
    func attemptDamage(attackPower:Int){
        self._HP -= attackPower
    }
    
    func isAlive() -> Bool {
        return self._HP > 0
    }
}