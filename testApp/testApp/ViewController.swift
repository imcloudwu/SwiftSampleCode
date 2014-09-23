//
//  ViewController.swift
//  testApp
//
//  Created by Cloud on 9/19/14.
//  Copyright (c) 2014 Cloud. All rights reserved.
//

import UIKit
import ischoolFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var con = Connector()
        con.connect("http://dev.ischool.com.tw:8080/cs4_beta/dev.sh_d", contract: "auth.school", account: "admin", password: "1234")
        con.sendRequest("DS.Base.Connect",elem:"SessionID")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

