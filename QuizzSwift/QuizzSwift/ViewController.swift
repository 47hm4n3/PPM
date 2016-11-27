//
//  ViewController.swift
//  QuizzSwift
//
//  Created by m2sar on 22/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var maxN : Int = 10
    var maxB : Int = 15
    
    var myQuizz : Quizz = Quizz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myView.init(frame: UIScreen.main.bounds)
        myQuizz.initQuizz(maxNormal: maxN, maxBalaise: maxB)
        affichage()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func affichage() {
        let v = self.view as! myView
        v.qView.text = myQuizz.affichageQR().question
        if (myQuizz.affichageQR().requete) {
            v.rView.text = myQuizz.affichageQR().reponse
        } else {
            v.rView.text = ""
        }
        v.cptRepLabel.text = String (format : "Réponses vues :  %d", myQuizz.cptReponse)
    }
    
    func qNavig(_ sender: UIButton) {
        let v = self.view as! myView
        if(sender === v.qSuiv) {
            myQuizz.qNavig(bouton : "qSuiv")
        } else {
            myQuizz.qNavig(bouton: "qPrec")
        }
        
        affichage()
    }
    
    func ddeReponse(_ sender: UIButton) {
        
        myQuizz.ddeReponse()
        
        affichage()
    }
    
    func monSwitch(_ sender: AnyObject) {
        
        myQuizz.isBalaise = myQuizz.isBalaise ? false : true
        myQuizz.max = myQuizz.isBalaise ? maxB : maxN
        
        affichage()
    }
}

