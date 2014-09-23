//
//  ViewController.swift
//  testApp
//
//  Created by Cloud on 9/19/14.
//  Copyright (c) 2014 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var connector = Connector(url:"http://dev.ischool.com.tw:8080/cs4_beta/dev.sh_d", contract: "auth.school", account: "admin", password:"1234")
        connector.sendRequest("DS.Base.Connect",elem:"SessionID")

        var str = "<root Name='root'><elem1 Name='elem1'>inner1</elem1><elem2 Name='elem2'>inner2</elem2></root>"
        var xml = XmlParser()
        xml.Parse(str)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}