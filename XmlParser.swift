//
//  XmlParser.swift
//  ischoolFramework
//
//  Created by Cloud on 9/23/14.
//  Copyright (c) 2014 Cloud. All rights reserved.
//

import Foundation

public class XmlParser: NSObject,NSXMLParserDelegate {
    
    var _parser:NSXMLParser!
    var _found:Bool = false
    
    public func Parse(xmlStr:String){
        println(xmlStr)
        _parser = NSXMLParser(data: xmlStr.dataUsingEncoding( NSUTF8StringEncoding, allowLossyConversion: true))
        _parser.delegate = self
        _parser.parse()
    }
    
    func parser(parser: NSXMLParser!,didStartElement elementName: String!, namespaceURI: String!, qualifiedName : String!, attributes attributeDict: [NSObject : AnyObject]!) {
        if elementName == "root"{
            println("=====This is attributeDict=====")
            println(attributeDict)
            _found = true
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        if elementName == "root"{
            _found = false
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if _found {
            println("====found=====")
            println(string)
        }
    }
    
    func parser(parser: NSXMLParser!, parseErrorOccurred parseError: NSError!) {
        println("=====This is parserError=====")
        println(parseError)
    }
}