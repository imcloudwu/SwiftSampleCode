//
//  Connector.swift
//  ischoolFramework
//
//  Created by Cloud on 9/19/14.
//  Copyright (c) 2014 Cloud. All rights reserved.
//

import Foundation

public class Connector : NSObject{

    var _request:NSMutableURLRequest!
    var _url:String!
    var _contract:String!
    var _account:String!
    var _password:String!
    
    public init(url:String,contract:String,account:String,password:String){
        
        _request = NSMutableURLRequest()
        _url = url
        _contract = contract
        _account = account
        _password = password
    }

    public func sendRequest(service:String,elem:String){
        
        _request.URL = NSURL(string: _url)
        
        let para = "<Envelope><Header><TargetContract>\(_contract)</TargetContract><TargetService>\(service)</TargetService><SecurityToken Type='Basic'><UserName>\(_account)</UserName><Password>\(_password)</Password></SecurityToken></Header><Body><RequestSessionID/></Body></Envelope>"
        
        _request.HTTPMethod = "POST"
        
        _request.HTTPBody = para.dataUsingEncoding( NSUTF8StringEncoding, allowLossyConversion: true)
        
        println("=====This is request=====")
        println(para)
        
        var con = NSURLConnection(request: _request, delegate: self, startImmediately: true)
        con.start()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        var string = NSString(data: data, encoding: NSUTF8StringEncoding)
        println("=====This is resopnse=====")
        println(string)
    }
}