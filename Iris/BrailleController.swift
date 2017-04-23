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
    @IBAction func aButton(_ sender: Any) {
        if(a == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    @IBAction func bButton(_ sender: Any) {
        if(b == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    @IBAction func cButton(_ sender: Any) {
        if(c == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    @IBAction func dButton(_ sender: Any) {
        if(d == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    @IBAction func eButton(_ sender: Any) {
        if(e == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    @IBAction func fButton(_ sender: Any) {
        if(f == 1){
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    
    @IBOutlet weak var label: UILabel!
    var messageFromViewController = String()
    
    func prepareLabel(){
        let local = messageFromViewController
        label.text = local
        choose(char: local[0])
    }
    
    override func viewDidLoad() {
        prepareLabel()
    }
    
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
    subscript(pos: Int) -> String {
        precondition(pos >= 0, "character position can't be negative")
        return self[pos...pos]
    }
    subscript(range: Range<Int>) -> String {
        precondition(range.lowerBound >= 0, "range lowerBound can't be negative")
        let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? endIndex
        return self[lowerIndex..<(index(lowerIndex, offsetBy: range.count, limitedBy: endIndex) ?? endIndex)]
    }
    subscript(range: ClosedRange<Int>) -> String {
        precondition(range.lowerBound >= 0, "range lowerBound can't be negative")
        let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? endIndex
        return self[lowerIndex..<(index(lowerIndex, offsetBy: range.count, limitedBy: endIndex) ?? endIndex)]
    }
}
