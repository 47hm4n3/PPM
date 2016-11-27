//
//  MyView.swift
//  MiniNav
//
//  Created by 47hm4n3 on 27/10/2016.
//  Copyright © 2016 znbk. All rights reserved.
//

import Foundation
import UIKit

class MyView : UIView, UIWebViewDelegate
{
    var myToolbar: UIToolbar!;
    var myHomeLoadButton: UIBarButtonItem!;
    var myHomeChangeButton : UIBarButtonItem!;
    var myUrlButton: UIBarButtonItem!;
    var myNextButton: UIBarButtonItem!;
    var myPreviousButton: UIBarButtonItem!;
    var emptyy: UIBarButtonItem!;
    var toolbarItems : [UIBarButtonItem]!;
    var myWebView : UIWebView!;
    var myIndicator : UIActivityIndicatorView!;
    var monUrl : String!;
    var cptURL : Int = 0;
    var maxURL : Int = 1;
    
    var answer : UITextField!;
    var answer_bis : UITextField!;
    var popup : UIAlertController!;
    var actionCancel : UIAlertAction!;
    var actionConfirm : UIAlertAction!;
    var popup_bis : UIAlertController!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        myToolbar = UIToolbar();
        myToolbar.barStyle = .default;
        myToolbar.barTintColor = UIColor.white;
        myHomeLoadButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(actionHomeLoad))
        myHomeChangeButton = UIBarButtonItem(barButtonSystemItem: .compose, target:nil, action: nil);
        myNextButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target:self, action: #selector(actionNext));
        myNextButton.isEnabled = false;
        myPreviousButton = UIBarButtonItem(barButtonSystemItem: .rewind, target:self, action: #selector(actionPrevious));
        myPreviousButton.isEnabled = false;
        myUrlButton = UIBarButtonItem(barButtonSystemItem: .action, target:nil, action: nil);
        emptyy = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil);
        
        toolbarItems = [UIBarButtonItem]();
        toolbarItems.append(myHomeLoadButton);
        toolbarItems.append(emptyy);
        toolbarItems.append(myPreviousButton);
        toolbarItems.append(myUrlButton);
        toolbarItems.append(myNextButton);
        toolbarItems.append(emptyy);
        toolbarItems.append(myHomeChangeButton);
        myToolbar.setItems(toolbarItems, animated:true);
        
        myWebView = UIWebView();
        myIndicator = UIActivityIndicatorView();
        myIndicator.backgroundColor = UIColor.clear;
        myIndicator.hidesWhenStopped = true;
        myIndicator.color = self.tintColor;
        
        popup = UIAlertController(title: "Proceed", message: "Do you want to proceed?", preferredStyle: UIAlertControllerStyle.alert);
        actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {(action) in self.handleButton(alert: self.actionCancel)});
        actionConfirm = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: {(action) in self.handleButton(alert: self.actionConfirm)});
        popup.addAction(actionConfirm);
        popup.addAction(actionCancel);
        popup.addTextField(configurationHandler: {field -> Void in field.textColor = UIColor.blue; field.text = "https://"; self.answer = field})

        popup_bis = UIAlertController(title: "Votre URL", message: "Saisissez-là ici", preferredStyle: UIAlertControllerStyle.alert);
        actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {(action) in self.handleButton_bis(alert: self.actionCancel)});
        actionConfirm = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: {(action) in self.handleButton_bis(alert: self.actionConfirm)});
        popup_bis.addAction(actionConfirm);
        popup_bis.addAction(actionCancel);
        popup_bis.addTextField(configurationHandler: {field -> Void in field.textColor = UIColor.blue; field.text = "https://"; self.answer_bis = field})
        
        
        addSubview(myToolbar);
        addSubview(myWebView);
        addSubview(myIndicator);
        myWebView.delegate = self;
        monUrl = "https://lip6.fr";
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func actionHomeLoad() {
        myWebView.loadRequest(URLRequest(url: URL(string: monUrl)!));
    }
    
    func handleButton(alert:UIAlertAction){
        switch(alert.style) {
        case .cancel:
            print("Cancel");
        case .default:
            print("Default");
          
            myNextButton.isEnabled = false;
            myPreviousButton.isEnabled = true;
            monUrl = self.answer.text;
            self.actionHomeLoad();
            myPreviousButton.isEnabled = true;
            cptURL += 1;
            maxURL += 1;
            
        default:
            print("Error");
        }
    }
    
    func handleButton_bis(alert:UIAlertAction){
        switch(alert.style) {
        case .cancel:
            print("Cancel");
        case .default:
            print("Default");
           
            myNextButton.isEnabled = false;
            myPreviousButton.isEnabled = true;
            myWebView.loadRequest(URLRequest(url: URL(string: self.answer_bis.text!)!));
            myPreviousButton.isEnabled = true;
            cptURL += 1;
            maxURL += 1;
            
        default:
            print("Error");
        }
    }
    
    func actionNext() {
        if(myWebView.canGoForward){
            myWebView.goForward();
            cptURL += 1;
            myPreviousButton.isEnabled = true;
            if(cptURL == maxURL) {
                myNextButton.isEnabled = false;
            }
        }
    }
    
    func actionPrevious() {
        if(myWebView.canGoBack){
            myWebView.goBack();
            cptURL -= 1;
            myNextButton.isEnabled = true;
            if(cptURL == 0){
                myPreviousButton.isEnabled = false;
            }
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myIndicator.startAnimating();
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myIndicator.stopAnimating();
    }
    
    
    
    override func draw(_ rect: CGRect) {
        
        myToolbar.frame = CGRect(x: 0, y: 0, width: frame.width, height: 65);
        
        myWebView.frame = CGRect(x: 0, y: myToolbar.frame.size.height, width: self.frame.width, height: self.frame.height-myToolbar.frame.size.height);
        
        myIndicator.frame = CGRect(x: myWebView.frame.width * 0.15, y: 15, width: 40, height: 40);
    }
}
