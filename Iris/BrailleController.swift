//
//  BrailleController.swift
//  Iris
//
//  Created by Michael Tang on 4/22/17.
//  Copyright © 2017 Michael Tang. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

class BrailleController : UIViewController {
    var a = 0
    var b = 0
    var c = 0
    var d = 0
    var e = 0
    var f = 0
    //event listener variables
    var u = 0
    var v = 0
    var w = 0
    var x = 0
    var y = 0
    var z = 0
    
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    
    @IBAction func aButton(_ sender: Any) {
        if(a == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        u = 0
        prepareNextChar()
    }
    @IBAction func bButton(_ sender: Any) {
        if(b == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        v = 0
        prepareNextChar()
    }
    @IBAction func cButton(_ sender: Any) {
        if(c == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        w = 0
        prepareNextChar()
    }
    @IBAction func dButton(_ sender: Any) {
        if(d == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        x = 0
        prepareNextChar()
    }
    @IBAction func eButton(_ sender: Any) {
        if(e == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        y = 0
        prepareNextChar()
    }
    @IBAction func fButton(_ sender: Any) {
        if(f == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        z = 0
        prepareNextChar()
    }
    
    
    @IBOutlet weak var label: UILabel!
    var messageFromViewController = String()
    
    //Updates UI label and sets inital modes on the pins
    func prepareLabel(){
        let local = messageFromViewController
        label.text = local
        let index = local.index(local.startIndex, offsetBy: 0)
        u = 1
        v = 1
        w = 1
        x = 1
        y = 1
        z = 1
        choose(char: String(local[index]))
        return
    }
    
    override func viewDidLoad() {
        prepareLabel()
    }
    
    func prepareNextChar() -> Void {
        if(u == 0 && w == 0 && v == 0 && x == 0 && y == 0 && z == 0){
            //consume first char in message and set next viberation pattern and set label
            //Comsume char
            let sizeofstr = messageFromViewController.characters.count
            if(sizeofstr <= 1){
                //End of braille translation
                let end = UINotificationFeedbackGenerator()
                end.notificationOccurred(.error)
                print("End called")
                
                let alertController = UIAlertController(title: "Completed", message: "End of message", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "continue", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                label.text = ""
                messageFromViewController = ""
                return
            }
            print("All buttons have been pressed")
            //Perhaps have a viberation to indicate character is finished?
            
            //Consume first char and present message as a substr without the first char
            let nextCharIndex = messageFromViewController.index(messageFromViewController.startIndex, offsetBy: 1)
            let newSubstr = messageFromViewController.substring(from: nextCharIndex)
            
            //Update message
            messageFromViewController = newSubstr
            
            //complete preparation and send control back to prepareLabel
            prepareLabel()
            
        }
        return
    }
    
    //Map function
    func choose(char: String) {
        
        if char == "a" || char == "1" {
            a = 1
            b = 0
            c = 0
            d = 0
            e = 0
            f = 0
            return
        }
        if char == "b" || char == "2" {
            a = 1
            b = 0
            c = 1
            d = 0
            e = 0
            f = 0
            return
        }
        if char == "c" || char == "3" {
            a = 1
            b = 1
            c = 0
            d = 0
            e = 0
            f = 0
            return
        }
        if char == "d" || char == "4" {
            a = 1
            b = 1
            c = 0
            d = 1
            e = 0
            f = 0
            return
        }
        if char == "e" || char == "5" {
            a = 1
            b = 0
            c = 0
            d = 1
            e = 0
            f = 0
            return
        }
        if char == "f" || char == "6" {
            a = 1
            b = 1
            c = 1
            d = 0
            e = 0
            f = 0
            return
        }
        if char == "g" || char == "7" {
            a = 1
            b = 1
            c = 1
            d = 1
            e = 0
            f = 0
            return
        }
        if char == "h" || char == "8" {
            a = 1
            b = 0
            c = 1
            d = 1
            e = 0
            f = 0
            return
        }
        if char == "i" || char == "9" {
            a = 0
            b = 1
            c = 1
            d = 0
            e = 0
            f = 0
            return
        }
        if char == "j" || char == "0" {
            a = 0
            b = 1
            c = 1
            d = 1
            e = 0
            f = 0
            return
        }
        if char == "k" {
            a = 1
            b = 0
            c = 0
            d = 0
            e = 1
            f = 0
            return
        }
        if char == "l" {
            a = 1
            b = 0
            c = 1
            d = 0
            e = 1
            f = 0
            return
        }
        if char == "m" {
            a = 1
            b = 1
            c = 0
            d = 0
            e = 1
            f = 0
            return
        }
        if char == "n" {
            a = 1
            b = 1
            c = 0
            d = 1
            e = 1
            f = 0
            return
        }
        if char == "o" {
            a = 1
            b = 0
            c = 0
            d = 1
            e = 1
            f = 0
            return
        }
        if char == "p" {
            a = 1
            b = 1
            c = 1
            d = 0
            e = 1
            f = 0
            return
        }
        if char == "q" {
            a = 1
            b = 1
            c = 1
            d = 1
            e = 1
            f = 0
            return
        }
        if char == "r" {
            a = 1
            b = 0
            c = 1
            d = 1
            e = 1
            f = 0
            return
        }
        if char == "s" {
            a = 0
            b = 1
            c = 1
            d = 0
            e = 1
            f = 0
            return
        }
        if char == "t" {
            a = 0
            b = 1
            c = 1
            d = 1
            e = 1
            f = 0
            return
        }
        if char == "u" {
            a = 1
            b = 0
            c = 0
            d = 0
            e = 1
            f = 1
            return
        }
        if char == "v" {
            a = 1
            b = 0
            c = 1
            d = 0
            e = 1
            f = 1
            return
        }
        if char == "w" {
            a = 0
            b = 1
            c = 1
            d = 1
            e = 0
            f = 1
            return
        }
        if char == "x" {
            a = 1
            b = 1
            c = 0
            d = 0
            e = 1
            f = 1
            return
        }
        if char == "y" {
            a = 1
            b = 1
            c = 0
            d = 1
            e = 1
            f = 1
            return
        }
        if char == "z" {
            a = 1
            b = 0
            c = 0
            d = 1
            e = 1
            f = 1
            return
        }
        if char == " " {
            a = 0
            b = 1
            c = 0
            d = 1
            e = 1
            f = 1
            return
        }
    }
}



extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}
