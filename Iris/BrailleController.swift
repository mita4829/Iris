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
    
    @IBOutlet weak var label: UILabel!
    var messageFromViewController = String()
    
    func prepareLabel(){
        let local = messageFromViewController
        label.text = local
    }
    
    override func viewDidLoad() {
        prepareLabel()
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
