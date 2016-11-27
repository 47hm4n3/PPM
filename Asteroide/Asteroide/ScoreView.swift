//
//  ScoreView.swift
//  Asteroide
//
//  Created by m2sar on 07/11/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import Foundation

import UIKit

class ScoreView : UIView, UITextFieldDelegate{
    let labelBestScore = UILabel()
    let labelYourScore = UILabel()
    let playerName = UITextField()
    let doneButton = UIButton()
    let yourScore = UILabel()
    let bestScore = UITextView()
    var scoresTable : [(String, Int)] = [("????",6000),("????",5000),("????",4000),("????",2000),("????",1000)]
    var str: String = ""
    var max : Int = 0 //nombre max de scores a afficher
    
    
    // TODO : AJOUTER TABLEAU DE SCORE POUR CHAQUE NIVEAU !!!!!!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        /*
        for i in 0...4{
            NSLog("\(i)")
            scoresTable[i].0 = "????"
            scoresTable[i].1 = 0
        }*/
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        
        self.backgroundColor = UIColor.clear
        
        for i in 0...4{
            str += "\(scoresTable[i].0) \(scoresTable[i].1)\n"
        }
        bestScore.text = str
        str = ""
        
        labelBestScore.text = "Meilleurs scores:"
        labelYourScore.text = "Votre score:"
        doneButton.setTitle("Done", for: .normal)
        
        playerName.delegate = self
        
        self.doneButton.addTarget(self, action: #selector(doneAction), for: .touchDown)
        
        self.addSubview(blurEffectView)//0
        self.addSubview(labelBestScore)//1
        self.addSubview(labelYourScore)//2
        self.addSubview(bestScore)//3
        self.addSubview(yourScore)//4
        self.addSubview(doneButton)//5
        self.addSubview(playerName)//6
        
    }
    
    func bestScoreAction(n : Int){
        var test : Bool = false
        var tmp : (String, Int)
        for i in 0...4{
            if((n > scoresTable[i].1) && (test == false)){
                tmp.0 = scoresTable[i].0
                tmp.1 = scoresTable[i].1
                scoresTable[i].1 = n
                scoresTable[i].0 = "????"
                test = true
            }
                str += "\(scoresTable[i].0) \(scoresTable[i].1)\n"
        }
        bestScore.text = str
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Label fixe : Meilleurs scores
        labelBestScore.frame = CGRect(x: rect.size.width / 2 - rect.size.width * 10/100,
                                 y: rect.size.height * 10/100,
                                 width: rect.size.width * 20/100,
                                 height: rect.size.height * 4/100)
        labelBestScore.backgroundColor = UIColor.clear
        labelBestScore.textColor = UIColor.white
        labelBestScore.textAlignment = .center
        labelBestScore.font = UIFont.boldSystemFont(ofSize: 16)
        
        // La liste des scores
        bestScore.frame = CGRect(x: rect.size.width / 2 - rect.size.width * 15/100,
                                 y: rect.size.height * 15/100,
                                 width: rect.size.width * 30/100,
                                 height: rect.size.height * 20/100)
        bestScore.backgroundColor = UIColor.clear
        bestScore.textColor = UIColor.white
        bestScore.textAlignment = .center
        
        // Label fixe : Votre score
        labelYourScore.frame = CGRect(x: rect.size.width / 2 - rect.size.width * 10/100,
                                      y: rect.size.height * 40/100,
                                      width: rect.size.width * 20/100,
                                      height: rect.size.height * 4/100)
        labelYourScore.backgroundColor = UIColor.clear
        labelYourScore.textColor = UIColor.white
        labelYourScore.textAlignment = .center
        labelYourScore.font = UIFont.boldSystemFont(ofSize: 16)
        
        // Score obtenu
        yourScore.frame = CGRect(x: rect.size.width / 2 - rect.size.width * 15/100,
                                 y: rect.size.height * 45/100,
                                 width: rect.size.width * 30/100,
                                 height: rect.size.height * 4/100)
        yourScore.backgroundColor = UIColor.clear
        yourScore.textColor = UIColor.white
        yourScore.textAlignment = .center
        
        // Bouton Done
        doneButton.frame = CGRect(x: rect.size.width * 85/100,
                                  y: rect.size.height * 5/100,
                                  width: rect.size.width * 10/100,
                                  height: rect.size.height * 4/100)
        doneButton.setTitleColor(self.tintColor, for: .normal)
        
        // Input text
        playerName.frame = CGRect(x: rect.size.width / 2 - rect.size.width * 15/100,
                                  y: rect.size.height * 55/100,
                                  width: rect.size.width * 30/100,
                                  height: rect.size.height * 6/100)
        playerName.text = "Saisissez votre nom..."
        playerName.textColor = UIColor.gray
        playerName.backgroundColor = UIColor.lightGray
        playerName.borderStyle = .roundedRect
    }
    
    /*
    func positionConstraint(){

        let widthConstraint = NSLayoutConstraint(item: self.labelBestScore, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 250)
        
        let heightConstraint = NSLayoutConstraint(item: self.labelBestScore, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 250)
        
        let leftConstraint = NSLayoutConstraint(item: self.labelBestScore, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.frame, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: self.labelBestScore, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.frame, attribute: NSLayoutAttribute.topMargin, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([leftConstraint,topConstraint, widthConstraint, heightConstraint])
    }*/
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        playerName.text = ""
        //textField.becomeFirstResponder()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.characters.count)! >= 6){
            textField.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
   
    func doneAction(){
        //self.superview?.subviews[6].isHidden = true //vPref
        self.isHidden = true //vScore
    }
}
