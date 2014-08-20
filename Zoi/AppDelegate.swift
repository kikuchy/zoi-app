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
        var word = zois[idx]["word"] as String?
        var pastbord = NSPasteboard.generalPasteboard()
        pastbord.declareTypes([NSStringPboardType], owner: nil)
        pastbord.setString(picpath, forType: NSStringPboardType)

        showUserNotification(picpath!, zoiWord: word!)

         NSApplication.sharedApplication().terminate(self)
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

    func showUserNotification(imagePath:String, zoiWord:String) {
        var imageURL: NSURL = NSURL.URLWithString(imagePath)
        var imageData: NSData = NSData(contentsOfURL: imageURL)
        var image: NSImage = NSImage(data: imageData)

        var notification:NSUserNotification = NSUserNotification()
        notification.title = "zoi-app"
        notification.subtitle = zoiWord
        notification.informativeText = imagePath
        notification.contentImage = image

        notification.soundName = NSUserNotificationDefaultSoundName
        var notificationcenter:NSUserNotificationCenter = NSUserNotificationCenter.defaultUserNotificationCenter()
        if let notificationCenter = NSUserNotificationCenter.defaultUserNotificationCenter() {
            notificationcenter.scheduleNotification(notification)
        }
    }

}

