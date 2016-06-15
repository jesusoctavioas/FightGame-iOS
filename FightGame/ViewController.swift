//
//  ViewController.swift
//  FightGame
//
//  Created by Alex Cuello ortiz on 27/4/16.
//  Copyright © 2016 None. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var buttonEnemy: UIButton!
    @IBOutlet var buttonPlayer: UIButton!
    @IBOutlet var descriptionAction: UILabel!
    
    @IBOutlet var characters: UIStackView!
    @IBOutlet var restarButton: UIButton!
    
    var player: Character!
    var enemy: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        defaultConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonEnemyPressed(sender: UIButton) {
        
        player.attemptDamage(enemy.attackPower)
        if player.HP <= 0 {
            endGame(winnerName: enemy.name, loserName: player.name)
        }
        else {
            descriptionAction.text = "\(enemy.name) attack, current \(player.name) health: \(player.HP) HP"
        }
    }

    @IBAction func buttonPlayerPressed(sender: AnyObject) {
        enemy.attemptDamage(player.attackPower)
        if enemy.HP <= 0 {
            endGame(winnerName: player.name, loserName: enemy.name)
        }
        else {
            descriptionAction.text = "\(player.name) attack, current \(enemy.name) health: \(enemy.HP) HP"
        }
    }
    
    @IBAction func restarButtonPressed(sender: UIButton) {
        defaultConfiguration()
    }
    
    func endGame(winnerName winnername:String, loserName losername:String){
        characters.hidden = true
        restarButton.hidden = false
        descriptionAction.text = "\(winnername) has killed \(losername)"
    }
    
    func defaultConfiguration(){
        characters.hidden = false
        player = Character(Health: 20, AttackPower: 10, Name: "Valira")
        enemy = Character(Health: 20, AttackPower: 5, Name: "Rexxar")
        descriptionAction.text = "\(enemy.name) health: \(enemy.HP) HP, \(player.name) health \(player.HP) HP"
        restarButton.hidden = true
    }
}

