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
    override func viewDidLoad() {
        label.text = messageFromViewController
    }
}
