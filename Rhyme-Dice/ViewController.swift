//
//  ViewController.swift
//  Rhyme-Dice
//
//  Created by Will Meier on 9/5/17.
//  Copyright © 2017 Will Meier. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var leftDie: UIImageView!
    @IBOutlet weak var rightDie: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func rollButton(_ sender: Any) {
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    func updateDiceImages(){
        let firstNumber = Int(arc4random_uniform(6)+1)
        let secondNumber = Int(arc4random_uniform(6)+1)
        
        let shortSounds = [1:"fat", 2:"head", 3:"thick", 4:"hot", 5:"luck", 6:"wood"]
        let longSounds = [1:"stay", 2:"sweet", 3:"bite", 4:"float", 5:"boy", 6:"again"]
        
        animateRoll(die:leftDie, imgSet:"Long", num:firstNumber)
        animateRoll(die:rightDie, imgSet:"Short", num:secondNumber)
        
        label.text = "spit bars rhymin with \(longSounds[firstNumber]!) n \(shortSounds[secondNumber]!)"
        
        leftDie.image = UIImage(named: "DiceLong\(firstNumber)")
        rightDie.image = UIImage(named: "DiceShort\(secondNumber)")
    }
    
    func animateRoll(die:UIImageView!, imgSet:String, num:Int){
        var imgList = (1..<6).map {UIImage(named:"Dice\(imgSet)\($0)")!}
        imgList.append(UIImage(named:"Dice\(imgSet)\(num)")!)
        die.animationImages = imgList
        die.animationDuration = 1.0
        die.animationRepeatCount = 1
        die.startAnimating()
    }

    
}
