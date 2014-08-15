//
//  AppDelegate.swift
//  Zoi
//
//  Created by kikuchy on 2014/08/15.
//  Copyright (c) 2014年 kikuchy. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        var filepath = NSBundle.mainBundle().pathForResource("pics", ofType: "plist")
        var zois = NSArray(contentsOfFile: filepath) as NSArray
        var idx = Int(arc4random_uniform(UInt32(zois.count)))
        var picpath = zois[idx]["image"] as String?
        var pastbord = NSPasteboard.generalPasteboard()
        pastbord.declareTypes([NSStringPboardType], owner: nil)
        pastbord.setString(picpath, forType: NSStringPboardType)
        NSApplication.sharedApplication().terminate(self)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

