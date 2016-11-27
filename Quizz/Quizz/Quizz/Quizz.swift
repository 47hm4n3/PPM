//
//  Quizz.swift
//  Quizz
//
//  Created by m2sar on 07/10/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import Foundation


class Quizz {

    struct QR {
        var question : String
        var reponse : String
        var requete : Bool
        init(ques: String, rep: String) {
            self.question = ques
            self.reponse = rep
            self.requete = false
        }
    }
    
    var normal : [QR] = []
    var balaise : [QR] = []
    var actuNormal : Int = 0
    var actuBalaise = 0
    var max : Int = 0
    var cptReponse : Int = 0
    var tmp : Int = 0
    var isBalaise : Bool = false
    
    
    func initQuizz(maxNormal : Int, maxBalaise : Int) {
        for k in 1...maxNormal {
            let qr = QR(ques: String (format : "Question normale %d", k), rep: String (format : "Reponse normale %d", k))

            normal.append (qr)
        }
        
        for k in 1...maxBalaise {
            let qr = QR(ques: String (format : "Question balaise %d", k), rep: String (format : "Reponse balaise %d", k))
            balaise.append (qr)
        }
        max = maxNormal
        isBalaise = false
    }
    
    
    func affichageQR() -> QR {
        if (isBalaise) {
            return balaise[actuBalaise]
        } else {
            return normal[actuNormal]
        }
    }
    
    
    func qNavig(bouton : String) {
        if (bouton == "qSuiv"){
            if (tmp < max-1) {
                tmp += 1
            }else{
                tmp = 0
            }
        }else{
            if (tmp > 0){
                tmp -= 1
            }else{
                tmp = max-1
            }
        }
        
        if isBalaise {
            actuBalaise = tmp
        }else {
            actuNormal = tmp
        }
    }
    
    func ddeReponse() {
        if (isBalaise) {
            if (!balaise[actuBalaise].requete){
                balaise[actuBalaise].requete = true
                cptReponse += 1
            }
        } else {
            if (!normal[actuNormal].requete){
                normal[actuNormal].requete = true
                cptReponse += 1
            }
        }
    }
    
  
}
