//
//  myView.swift
//  QuizzSwift
//
//  Created by m2sar on 22/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import Foundation
import UIKit

class myView : UIView {
    
    let qSuiv: UIButton = UIButton()
    let qPrec: UIButton = UIButton()
    let laReponse: UIButton = UIButton()
    let qView: UITextView = UITextView()
    let rView: UITextView = UITextView()
    let cptRepLabel: UILabel = UILabel()
    let monSwitch: UISwitch = UISwitch()
    let question: UILabel = UILabel()
    let reponse :UILabel = UILabel()
    let mode: UILabel = UILabel()
    
    override init(frame : CGRect) {
        
        laReponse.setTitle("La réponse", for: UIControlState.normal)
        qView.text = ""
        rView.text = ""
        cptRepLabel.text = ""
        monSwitch.isOn = false
        
        qSuiv.setImage(UIImage(named : "droite.png" ), for : UIControlState.normal)
        qPrec.setImage(UIImage(named : "gauche.png" ), for : UIControlState.normal)
        
        super.init(frame : frame)
        self.backgroundColor = UIColor.white
        self.addSubview(qSuiv)
        self.addSubview(qPrec)
        self.addSubview(laReponse)
        self.addSubview(qView)
        self.addSubview(rView)
        self.addSubview(cptRepLabel)
        self.addSubview(monSwitch)
        self.addSubview(question)
        self.addSubview(reponse)
        self.addSubview(mode)
        
        qSuiv.addTarget(self.subviews, action: #selector (ViewController.qNavig), for: UIControlEvents.touchDown)
        qPrec.addTarget(self.subviews, action: #selector (ViewController.qNavig), for: UIControlEvents.touchDown)
        laReponse.addTarget(self.subviews, action: #selector (ViewController.ddeReponse), for: UIControlEvents.touchDown)
        monSwitch.addTarget(self.subviews, action: #selector (ViewController.monSwitch), for: UIControlEvents.valueChanged)
        
               
    }
    
    override func draw(_ rect: CGRect) {
        
        qPrec.setTitleColor(self.tintColor, for: UIControlState.normal)
        qSuiv.setTitleColor(self.tintColor, for: UIControlState.normal)
        laReponse.setTitleColor(self.tintColor, for: UIControlState.normal)
        
        qView.textColor = UIColor.blue
        //qView.backgroundColor = UIColor.lightGray
        rView.textColor = UIColor.green
        //rView.backgroundColor = UIColor.lightGray
        cptRepLabel.textColor = UIColor.black
        question.textColor = UIColor.black
        reponse.textColor = UIColor.black
        mode.textColor = UIColor.black
        
        question.text = "Question : "
        reponse.text = "Réponse : "
        mode.text = "mode balaise"
        cptRepLabel.text = "Réponses demandées : "
        
        question.textAlignment = NSTextAlignment.center
        reponse.textAlignment = NSTextAlignment.center
        mode.textAlignment = NSTextAlignment.right
        cptRepLabel.textAlignment = NSTextAlignment.left
        
        qView.isEditable = false
        rView.isEditable = false
        
        qView.textAlignment = NSTextAlignment.center
        rView.textAlignment = NSTextAlignment.center
        
        
        qPrec.frame =       (CGRect( x: 0,
                                     y: (self.bounds.height*5/100),
                                     width: self.bounds.width*25/100,
                                     height: self.bounds.height*4/100))
        
        qSuiv.frame =       (CGRect( x: self.bounds.width*75/100,
                                     y: (self.bounds.height*5/100),
                                     width: self.bounds.width*25/100,
                                     height: self.bounds.height*4/100))
        
        laReponse.frame =   (CGRect( x: self.bounds.midX - (self.bounds.width*25/100/2),
                                     y: (self.bounds.height*5/100),
                                     width: self.bounds.width*25/100,
                                     height: self.bounds.height*4/100))
        
        question.frame =    (CGRect( x: (self.bounds.midX - self.bounds.width*25/100/2),
                                     y: (self.bounds.height*10/100),
                                     width: self.bounds.width*25/100,
                                     height: self.bounds.height*4/100))
        
        qView.frame =       (CGRect( x: self.bounds.width*10/100,
                                     y: (self.bounds.height*15/100),
                                     width: self.bounds.width*80/100,
                                     height: self.bounds.height*30/100))
    
        reponse.frame =     (CGRect( x: (self.bounds.midX - self.bounds.width*25/100/2),
                                     y: (self.bounds.height*45/100),
                                     width: self.bounds.width*25/100,
                                     height: self.bounds.height*4/100))
        
        rView.frame =       (CGRect( x: self.bounds.width*10/100,
                                     y: (self.bounds.height*50/100),
                                     width: self.bounds.width*80/100,
                                     height: self.bounds.height*30/100))

        mode.frame =        (CGRect( x: (self.bounds.width*65/100),
                                     y: (self.bounds.height*85/100),
                                     width: self.bounds.width*25/100,
                                     height: self.bounds.height*4/100))

        monSwitch.frame =   (CGRect( x: (self.bounds.width*75/100),
                                     y: (self.bounds.height*90/100),
                                     width: self.bounds.width*10/100,
                                     height: self.bounds.height*4/100))
        
        cptRepLabel.frame = (CGRect( x: (self.bounds.width*10/100),
                                     y: (self.bounds.height*90/100),
                                     width: self.bounds.width*50/100,
                                     height: self.bounds.height*4/100))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    

}
