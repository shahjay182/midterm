//
//  PeopleCountController.swift
//  Midterm
//
//  Created by Jay Shah on 2019-11-01.
//  Copyright © 2019 Jay Shah. All rights reserved.
//

import UIKit

class PeopleCountController: UIViewController {
  
    @IBOutlet weak var peopleFeild: UITextField!
    @IBOutlet weak var peopleSlider: UISlider!
    @IBOutlet weak var updatedSlider: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sliderChange(_ sender: Any) {
        updatedSlider.text = String(format: "%2d%", Int(peopleSlider.value))
    }
    
}
