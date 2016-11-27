//
//  ViewController.swift
//  DizainierSwift
//
//  Created by m2sar on 05/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stepperButton: UIStepper!
    @IBOutlet weak var monLabel: UITextField!
    
    @IBOutlet weak var dizainesSeg: UISegmentedControl!
    @IBOutlet weak var unitesSeg: UISegmentedControl!
    @IBOutlet weak var sliderbutton: UISlider!
    @IBOutlet weak var monSwitch: UISwitch!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stepperButton.maximumValue = 99
        stepperButton.minimumValue = 0
        sliderbutton.minimumValue = 0
        sliderbutton.maximumValue = 99
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func monSwitch(_ sender: UISwitch) {
        if (monSwitch.isOn) {
            monLabel.textColor = UIColor.red
          
        } else {
            monLabel.textColor = UIColor.black
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        sliderbutton.value  = Float(stepperButton.value);
        dizainesSeg.selectedSegmentIndex = Int(stepperButton.value) / 10;
        unitesSeg.selectedSegmentIndex   = Int(stepperButton.value) % 10;
        if (monSwitch.isOn) {
            monLabel.text = String(format:"%X", Int(stepperButton.value))
        } else {
            monLabel.text = String(format:"%d", Int(stepperButton.value))
        }
    }
    
    @IBAction func dizaines(_ sender: UISegmentedControl) {
        sliderbutton.value  = Float(dizainesSeg.selectedSegmentIndex * 10 + unitesSeg.selectedSegmentIndex);
        stepperButton.value = Double(sliderbutton.value);
        if (monSwitch.isOn) {
            monLabel.text = String(format:"%X", Int(stepperButton.value))
        } else {
            monLabel.text = String(format:"%d", Int(stepperButton.value))
        }
    }
    
    @IBAction func raz(_ sender: UIButton) {
        stepperButton.value = 0
        sliderbutton.value = 0
        dizainesSeg.selectedSegmentIndex = 0
        unitesSeg.selectedSegmentIndex   = 0
        monLabel.text = ""
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        stepperButton.value = Double(sliderbutton.value);
        dizainesSeg.selectedSegmentIndex = Int(sliderbutton.value) / 10;
        unitesSeg.selectedSegmentIndex   = Int(sliderbutton.value) % 10;
        if (monSwitch.isOn) {
            monLabel.text = String(format:"%X", Int(sliderbutton.value))
        } else {
            monLabel.text = String(format:"%d", Int(sliderbutton.value))
        }
    }

}

