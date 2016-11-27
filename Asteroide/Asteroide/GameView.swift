//
//  GameView.swift
//  Asteroide
//
//  Created by m2sar on 07/11/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

import Foundation

import UIKit

class GameView : UIView{
    
    let playButton = UIButton()
    let scoreButton = UIButton()
    let prefButton = UIButton()
    var blurEffectView = UIVisualEffectView()
    
    var labelScore = UILabel()
    var labelLevel = UILabel()
    let rightButton = UIButton()
    let leftButton = UIButton()
    let chasseur = UIImageView()
    var asteroideArray = [UIImageView.init(image: #imageLiteral(resourceName: "asteroide-100-1")),
                                  UIImageView.init(image:#imageLiteral(resourceName: "asteroide-100-2")),
                                  UIImageView.init(image:#imageLiteral(resourceName: "asteroide-100-3")),
                                  UIImageView.init(image:#imageLiteral(resourceName: "asteroide-100-4")),
                                  UIImageView.init(image:#imageLiteral(resourceName: "asteroide-120-1")),
                                  UIImageView.init(image:#imageLiteral(resourceName: "asteroide-120-2")),
                                  UIImageView.init(image:#imageLiteral(resourceName: "asteroide-120-3")),
                                  UIImageView.init(image:#imageLiteral(resourceName: "asteroide-120-4"))]
    
    var scoreValue : NSInteger = 0
    
    let vPref = PrefView(frame: UIScreen.main.bounds)
    let vScore = ScoreView(frame: UIScreen.main.bounds)
    
    var navigTimer = Timer()
    
    var random : Int = 0
    var angle : CGFloat = 0.0
    var pi : CGFloat = 3.14
    
    var gameOverLabel = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        // Avant PLAY
        playButton.setTitle("Play", for: .normal)
        scoreButton.setTitle("Scores", for: .normal)
        prefButton.setTitle("Préférences", for: .normal)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        blurEffectView.effect = blurEffect
        blurEffectView.frame = self.frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        
        self.backgroundColor = UIColor.clear
        
        self.addSubview(blurEffectView)//0
        self.addSubview(playButton)//1
        self.addSubview(scoreButton)//2
        self.addSubview(prefButton)//3
        
        
        // Après PLAY
        labelScore.text = "Score : 0"
        labelLevel.text = "Niveau : 1"
        rightButton.setTitle(">>>", for: .normal)
        leftButton.setTitle("<<<", for: .normal)
        gameOverLabel.text = "Game Over !!"
        
        chasseur.image = UIImage(named: "chasseur-TIE")

        gameOverLabel.isHidden = true
        labelScore.isHidden = true
        labelLevel.isHidden = true
        rightButton.isHidden = true
        leftButton.isHidden = true
        chasseur.isHidden = true
        //move chasseur
        rightButton.addTarget(self, action: #selector(navigateAction), for: .touchDown)
        rightButton.addTarget(self, action: #selector(stopNavig), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(navigateAction), for: .touchDown)
        leftButton.addTarget(self, action: #selector(stopNavig), for: .touchUpInside)
        
        
        
        self.addSubview(labelLevel) //4
        self.addSubview(labelScore) //5
        self.addSubview(rightButton) //6
        self.addSubview(leftButton) //7
        self.addSubview(chasseur) //8
        self.addSubview(gameOverLabel) //9
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Avant PLAY
        scoreButton.frame = CGRect(x: rect.size.width * 5/100,
                                  y: rect.size.height * 5/100,
                                  width: rect.size.width * 10/100,
                                  height: rect.size.height * 4/100)
        scoreButton.setTitleColor(.white, for: .normal)
        

        prefButton.frame = CGRect(x: rect.size.width * 75/100,
                                  y: rect.size.height * 5/100,
                                  width: rect.size.width * 20/100,
                                  height: rect.size.height * 4/100)
        prefButton.setTitleColor(.white, for: .normal)
        
        playButton.frame = CGRect(x: rect.size.width * 50/100 - rect.size.width * 10/100,
                                  y: rect.size.height * 50/100 - rect.size.height * 4/100,
                                  width: rect.size.width * 20/100,
                                  height: rect.size.height * 8/100)
        playButton.setTitleColor(.white, for: .normal)
        //playButton.setTitleColor(self.tintColor, for: .normal)
        playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        
        
        
        // Après PLAY
        rightButton.frame = CGRect(x: rect.size.width * 92/100,
                                  y: rect.size.height * 90/100,
                                  width: rect.size.width * 5/100,
                                  height: rect.size.height * 8/100)
        rightButton.setTitleColor(.white, for: .normal)
        
        leftButton.frame = CGRect(x: rect.size.width * 3/100,
                                   y: rect.size.height * 90/100,
                                   width: rect.size.width * 5/100,
                                   height: rect.size.height * 8/100)
        leftButton.setTitleColor(.white, for: .normal)
        
        labelScore.frame = CGRect(x: rect.size.width * 67/100,
                                  y: rect.size.height * 5/100,
                                  width: rect.size.width * 30/100,
                                  height: rect.size.height * 4/100)
        labelScore.backgroundColor = UIColor.clear
        labelScore.textColor = UIColor.white
        labelScore.textAlignment = .right
        
        labelLevel.frame = CGRect(x: rect.size.width * 3/100,
                                  y: rect.size.height * 5/100,
                                  width: rect.size.width * 15/100,
                                  height: rect.size.height * 4/100)
        labelLevel.backgroundColor = UIColor.clear
        labelLevel.textColor = UIColor.white
        labelLevel.textAlignment = .left
        
        chasseur.frame = CGRect(x: rect.size.width / 2 - rect.size.width * 2.5/100,
                                y: rect.size.height * 90/100,
                                width: rect.size.width * 5/100,
                                height: rect.size.height * 10/100)
        
        gameOverLabel.frame = CGRect(x: rect.size.width * 35/100,
                                  y: rect.size.height * 45/100,
                                  width: rect.size.width * 30/100,
                                  height: rect.size.height * 10/100)
        gameOverLabel.backgroundColor = UIColor.clear
        gameOverLabel.textColor = UIColor.white
        gameOverLabel.textAlignment = .center
        gameOverLabel.font = UIFont.boldSystemFont(ofSize: 35)
    }
    
    func play() {
        // Après avoir appuyé sur PLAY
        blurEffectView.isHidden = true
        playButton.isHidden = true
        prefButton.isHidden = true
        scoreButton.isHidden = true
        
        labelScore.isHidden = false
        labelLevel.isHidden = false
        rightButton.isHidden = false
        leftButton.isHidden = false
        chasseur.isHidden = false
        
        labelLevel.text = "Niveau : \(vPref.levelSelected + 1)"
        
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.gameOverLabel.isHidden = false
        }
        self.isHidden = true
        self.vScore.isHidden = false
        
    }
    
    func scores(){
        self.superview?.subviews[0].isHidden = false
        self.superview?.subviews[1].isHidden = false
        //self.superview?.subviews[2].isHidden = false
        //self.superview?.subviews[3].isHidden = true//vPrf
        self.addSubview(vPref)//10
        self.addSubview(vScore)//11
        
        vPref.isHidden = true
        vScore.isHidden = false
        
    }
    
    func preference(){
        self.superview?.subviews[0].isHidden = false
        self.superview?.subviews[1].isHidden = true
        //self.superview?.subviews[2].isHidden = true
        //self.superview?.subviews[3].isHidden = false
        self.addSubview(vPref)//10
        self.addSubview(vScore)//11
        
        vPref.isHidden = false
        vScore.isHidden = true
    }
    
    //begin move chasseur
    func navigateAction(_ sender: UIButton) {
        if (sender  == self.rightButton){
            navigTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(goRight), userInfo: nil, repeats: true)
        }else{
            navigTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(goLeft), userInfo: nil, repeats: true)
        }
    }
    
    func goRight(){
        if (chasseur.frame.origin.x < (self.frame.width * 90/100 - chasseur.frame.size.width)) {
            chasseur.frame.origin.x += 1
        }
    }
    
    func goLeft(){
        if (chasseur.frame.origin.x > (self.frame.width * 10/100)) {
            chasseur.frame.origin.x -= 1
        }
    }

    func stopNavig(){
        navigTimer.invalidate()
    }
    //end move chasseur
    
    func randNumbAsteroide(){
        random = (Int(arc4random_uniform(50)) + 20) * vPref.levelSelected / 2
    
    }
    
    func randAsteroide(){
        angle += pi/20
        if(angle > 2*pi){
            angle = 0.0
        }
        
        var i = Int(arc4random_uniform(8) + 1)
        asteroideArray[i].center = CGPoint(x:Int(arc4random())%Int(UIScreen.main.bounds.maxX), y: -Int(self.frame.size.height * 15/100))
        
        for i in 0...7{
            var posX = Int(asteroideArray[i].center.x) + vPref.levelSelected
            var posY = Int(asteroideArray[i].center.y) + vPref.levelSelected + 1
            asteroideArray[i].center = CGPoint(x: posX, y: posY)
            asteroideArray[i].transform = CGAffineTransform(rotationAngle: angle)
        }
        
        for i in 0...7 {
            if(asteroideArray[i].center.y >= (chasseur.center.y-UIScreen.main.bounds.maxY/16) && ((asteroideArray[i].center.x) > (chasseur.center.x-UIScreen.main.bounds.maxY/16) && ((asteroideArray[i].center.x) < (chasseur.center.x+UIScreen.main.bounds.maxY/16)))){
                
                for i in 0...7{
                    asteroideArray[i].isHidden=true
                }
                
                
                let deadlineTime = DispatchTime.now() + .seconds(1)
                DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                    self.gameOverLabel.isHidden = false
                }
                self.isHidden = true
                self.vScore.isHidden = false
                
                //self.view=scoresView
                
                self.leftButton.isHidden = true
                self.rightButton.isHidden = true
                self.chasseur.isHidden = true
                
                /*jouerBoutton.isHidden=false
                gameView.scoresBoutton.isHidden=false
                gameView.prefBoutton.isHidden=false
                
                gameView.t?.invalidate()
                gameView.t=nil
                gameView.score.text=("Score : \(modele.currentScore)")
                
                modele.mouvementDroit=false
                modele.mouvementGauche=false*/
            }
        }

    }


}
