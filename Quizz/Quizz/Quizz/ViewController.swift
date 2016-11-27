//
//  ViewController.swift
//  Quizz
//
//  Created by m2sar on 06/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var maxN : Int = 10
    var maxB : Int = 15
    
    var myQuizz : Quizz = Quizz()
   
    
    @IBOutlet weak var qSuiv: UIButton!
    @IBOutlet weak var qPrec: UIButton!
    @IBOutlet weak var laReponse: UIButton!
    @IBOutlet weak var qView: UITextView!
    @IBOutlet weak var rView: UITextView!
    @IBOutlet weak var cptRepLabel: UILabel!
    @IBOutlet weak var monSwitch: UISwitch!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myQuizz.initQuizz(maxNormal: maxN, maxBalaise: maxB)
        
        affichage()
        qSuiv.setImage(UIImage(named : "droite.png" ), for : UIControlState.normal)
        qPrec.setImage(UIImage(named : "gauche.png" ), for : UIControlState.normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func affichage() {
        qView.text = myQuizz.affichageQR().question
        if (myQuizz.affichageQR().requete) {
            rView.text = myQuizz.affichageQR().reponse
        } else {
            rView.text = ""
        }
        cptRepLabel.text = String (format : "Réponses vues :  %d", myQuizz.cptReponse)
    }
    
    @IBAction func qNavig(_ sender: UIButton) {
        if(sender === qSuiv) {
            myQuizz.qNavig(bouton : "qSuiv")
        } else {
            myQuizz.qNavig(bouton: "qPrec")
        }
        
        affichage()
    }
    
    @IBAction func ddeReponse(_ sender: UIButton) {

        myQuizz.ddeReponse()
        
        affichage()
    }
    
    @IBAction func monSwitch(_ sender: AnyObject) {
        
        myQuizz.isBalaise = myQuizz.isBalaise ? false : true
        myQuizz.max = myQuizz.isBalaise ? maxB : maxN
        
        affichage()
    }
}

