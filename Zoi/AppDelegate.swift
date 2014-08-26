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
        let filepath = NSBundle.mainBundle().pathForResource("pics", ofType: "plist")!
        let zois = NSArray(contentsOfFile: filepath) as NSArray
        let idx = Int(arc4random_uniform(UInt32(zois.count)))
        let picpath = zois[idx]["image"] as String?
        let word = zois[idx]["word"] as String?
        let pastbord = NSPasteboard.generalPasteboard()
        pastbord.declareTypes([NSStringPboardType], owner: nil)
        pastbord.setString(picpath, forType: NSStringPboardType)

        showUserNotification(picpath!, zoiWord: word!)

        NSApplication.sharedApplication().terminate(self)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

    func showUserNotification(imagePath:String, zoiWord:String) {
        let imageURL = NSURL.URLWithString(imagePath)
        let imageData = NSData(contentsOfURL: imageURL)
        let image = NSImage(data: imageData)

        let notification = NSUserNotification()
        notification.title = "zoi-app"
        notification.subtitle = zoiWord
        notification.informativeText = imagePath
        notification.contentImage = image
        notification.soundName = NSUserNotificationDefaultSoundName
        
        let notificationcenter = NSUserNotificationCenter.defaultUserNotificationCenter()
        notificationcenter.scheduleNotification(notification)
    }

}

