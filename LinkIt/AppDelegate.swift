//
//  AppDelegate.swift
//  LinkIt
//
//  Created by Dale Puckett on 11/27/16.
//  Copyright © 2016 k0hyd. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

        var item : NSStatusItem? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        item = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        item?.image = NSImage(named: "link")
        
        let menu = NSMenu()
        menu.addItem(withTitle: "Link It!", action: #selector(AppDelegate.linkIt), keyEquivalent: "")
        menu.addItem(withTitle: "Quit", action: #selector(AppDelegate.quit), keyEquivalent: "")
        
        item?.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func linkIt() {
        print ("We Made It")
        
            if let items = NSPasteboard.general().pasteboardItems {
                for item in items {
                    for type in item.types {
                        if type == "public.utf8-plain-text" {
                            if let url = item.string(forType: type){
                                NSPasteboard.general().clearContents()
                                
                                var actualURL = url
                                
                                if url.hasPrefix("http://") || url.hasPrefix("https://"){
                                } else {
                                    actualURL = "http://\(url)"
                                }
                                
                                NSPasteboard.general().setString("<a href=\"\(actualURL)\">\(url)</a>", forType: "public.html")
                                NSPasteboard.general().setString(url, forType: "public.utf8-plain-text")
                                
                                // HamNationVideos.info
                            }
                        }

                }
            }
        }
        
        printPasteboard()
    }
    
    func quit() {
        NSApplication.shared().terminate(self)
    }
    
    func printPasteboard() {
        if let items = NSPasteboard.general().pasteboardItems {
            for item in items {
                for type in item.types {
                    print("Type: \(type)")
                    print("String: \(item.string(forType: type))")                }
            }
        }
    }


}

