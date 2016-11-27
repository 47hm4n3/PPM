//
//  ViewController.swift
//  MiniNav
//
//  Created by znbk on 27/10/2016.
//  Copyright © 2016 znbk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var web: MyView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        web = MyView(frame : UIScreen.main.bounds)
        self.view = web
        web.myHomeChangeButton.action=#selector(self.show_alert)
        web.myUrlButton.action=#selector(self.show_alert_bis)
        web.actionHomeLoad();
        //web.myWebView.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func show_alert(){
        self.present(web.popup, animated: true, completion: nil)
    }
    func show_alert_bis(){
        self.present(web.popup_bis, animated: true, completion: nil)
    }

}

