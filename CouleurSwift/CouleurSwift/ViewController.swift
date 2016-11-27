//
//  ViewController.swift
//  CouleurSwift
//
//  Created by m2sar on 26/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var box: UIView!
    @IBOutlet weak var stepp: UIStepper!
    var tabcolor = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        stepp.maximumValue = 5.0
        stepp.minimumValue = 0.0
        
        tabcolor.append(UIColor.white)
        tabcolor.append(UIColor.blue)
        tabcolor.append(UIColor.green)
        tabcolor.append(UIColor.yellow)
        tabcolor.append(UIColor.orange)
        tabcolor.append(UIColor.red)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func stepper(_ sender: UIStepper) {
        
        box.backgroundColor = tabcolor[Int(stepp.value)]
        
    }

}

