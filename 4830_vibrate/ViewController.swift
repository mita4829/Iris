//
//  ViewController.swift
//  4830_vibrate
//
//  Created by Ross Blassingame on 4/22/17.
//  Copyright © 2017 Ross Blassingame. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func Button1Vibrate(_ sender: Any) {
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
	}

	@IBAction func Button2Vibrate(_ sender: Any) {
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
	}
	
	@IBAction func Button3Vibrate(_ sender: Any) {
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
	}
	
	@IBAction func Button4Vibrate(_ sender: Any) {
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
	}
	
	@IBAction func Button5Vibrate(_ sender: Any) {
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
	}
	
	@IBAction func Button6Vibrate(_ sender: Any) {
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
	}
}

