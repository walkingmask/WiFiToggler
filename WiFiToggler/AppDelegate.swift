//
//  AppDelegate.swift
//  WiFiToggler
//
//  Created by Kazuki Nagamine on 9/20/16.
//  Copyright © 2016 walkingmask. All rights reserved.
//

import Cocoa
import Magnet // hotkey register libraty

@available(OSX 10.10, *) // only for 10.10 or later
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    // create app as status item
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        // login launch
        setLaunchAtLoginEnabled(true)

        // status bar button settings
        if let button = statusItem.button {
            let img = NSImage(named: "iconblack")
            img?.template = true
            button.image = img
        }
        
        // status menu settings
        let menu = NSMenu()
        // Turn Wi-Fi Off
        menu.addItem(NSMenuItem(title: "Turn Wi-Fi Off (⇧F5)", action: #selector(AppDelegate.turnWiFiOff), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separatorItem())
        // Turn Wi-Fi On
        menu.addItem(NSMenuItem(title: "Turn Wi-Fi On  (⇧F6)", action: #selector(AppDelegate.turnWiFiOn), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separatorItem())
        // Quit
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(AppDelegate.terminate), keyEquivalent: ""))
        statusItem.menu = menu
        
        // hotkey settings
        // Turn Wi-Fi Off (Shift + F5)
        guard let keyCombo1 = KeyCombo(keyCode: 96, cocoaModifiers: [.ShiftKeyMask]) else { return }
        let hotKey1 = HotKey(identifier: "ShiftF5",
                            keyCombo: keyCombo1,
                            target: self,
                            action: #selector(AppDelegate.turnWiFiOff))
        hotKey1.register()
        // Turn Wi-Fi On (Shift + F6)
        guard let keyCombo2 = KeyCombo(keyCode: 97, cocoaModifiers: [.ShiftKeyMask]) else { return }
        let hotKey2 = HotKey(identifier: "ShiftF6",
                            keyCombo: keyCombo2,
                            target: self,
                            action: #selector(AppDelegate.turnWiFiOn))
        hotKey2.register()
    }
    
    // execute turn wifi off shell script
    func turnWiFiOff() {
        let cmd:String = "/bin/bash"
        let task:NSTask = NSTask()
        task.launchPath = cmd
        task.arguments  = ["/Users/walkingmask/Developments/WiFiToggler/src/WiFiToggle.sh"]
        task.launch()
    }
    
    // execute turn wifi on shell script
    func turnWiFiOn() {
        let cmd:String = "/bin/bash"
        let task:NSTask = NSTask()
        task.launchPath = cmd
        task.arguments  = ["/Users/walkingmask/Developments/WiFiToggler/src/WiFiToggle.sh"]
        task.launch()
    }
    
    // quit function
    func terminate(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(self)
    }
    func applicationWillTerminate(aNotification: NSNotification) {
        // release all registered hotkeys
        HotKeyCenter.sharedCenter.unregisterAll()
    }
    
    // login launch settings
    func setLaunchAtLoginEnabled(enabled: Bool) {
        if !enabled { return }
        
        // get apple script filepath
        let filename:String = enabled ? "AddLoginItem" : "DeleteLoginItem";
        var template:String = ""
        if let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "scpt") {
            do {
                template = try String(contentsOfFile: filePath,
                                     encoding: NSUTF8StringEncoding)
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        // get app name
        var source:String = ""
        let localizedName:String = NSRunningApplication.currentApplication().localizedName!
        if enabled {
            let bundlePath:String = NSBundle.mainBundle().bundlePath
            source = String(format: template, bundlePath, localizedName)
        }
        
        // run apple script
        var error:NSDictionary?
        if let script = NSAppleScript(source: source) {
            script.executeAndReturnError(&error)
            if error != nil {
                print(error)
            }
        }
    }
}

