//
//  ViewController.swift
//  BonrevoirSwift
//
//  Created by m2sar on 22/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monLabel: UILabel!

    @IBOutlet weak var buttonoutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        monLabel.text = ""
        buttonoutlet.setTitle("Dis Bonjour", for: UIControlState.normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func monBouton(_ sender: UIButton) {
        if(sender.titleLabel?.text == "Dis Aurevoir"){
            monLabel.text = "Aurevoir"
            sender.setTitle("Dis Bonjour", for: UIControlState.normal)
        }else{
            monLabel.text = "Bonjour"
            sender.setTitle("Dis Aurevoir", for: UIControlState.normal)
        }
        
        
        
    }
    

}

