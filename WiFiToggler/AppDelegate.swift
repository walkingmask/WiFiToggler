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
        // Turn Wi-Fi On
        menu.addItem(NSMenuItem(title: "Turn Wi-Fi On  (⇧F6)", action: #selector(AppDelegate.turnWiFiOn), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separatorItem())
        // Ingest halcyon
        menu.addItem(NSMenuItem(title: "Halcyon        (⇧F1)", action: #selector(AppDelegate.ingestHalcyon), keyEquivalent: ""))
        // Ingest caffeine
        menu.addItem(NSMenuItem(title: "Caffeine       (⇧F2)", action: #selector(AppDelegate.ingestCaffeine), keyEquivalent: ""))
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
        // Ingest halcyon (Shift + F1)
        guard let keyCombo3 = KeyCombo(keyCode: 122, cocoaModifiers: [.ShiftKeyMask]) else { return }
        let hotKey3 = HotKey(identifier: "ShiftF1",
                             keyCombo: keyCombo3,
                             target: self,
                             action: #selector(AppDelegate.ingestHalcyon))
        hotKey3.register()
        // Ingest caffeine (Shift + F2)
        guard let keyCombo4 = KeyCombo(keyCode: 120, cocoaModifiers: [.ShiftKeyMask]) else { return }
        let hotKey4 = HotKey(identifier: "ShiftF2",
                             keyCombo: keyCombo4,
                             target: self,
                             action: #selector(AppDelegate.ingestCaffeine))
        hotKey4.register()
    }
    
    // execute turn wifi off shell script
    func turnWiFiOff() {
        let cmd:String = "/bin/sh"
        let task:NSTask = NSTask()
        task.launchPath = cmd
        let arg:String = "[[ \"`networksetup -getairportpower en0`\" =~ \"On\" ]] && networksetup -setairportpower en0 Off"
        task.arguments = ["-c", arg]
        task.launch()
    }
    
    // execute turn wifi on shell script
    func turnWiFiOn() {
        let cmd:String = "/bin/sh"
        let task:NSTask = NSTask()
        task.launchPath = cmd
        let arg:String = "[[ \"`networksetup -getairportpower en0`\" =~ \"Off\" ]] && networksetup -setairportpower en0 On"
        task.arguments = ["-c", arg]
        task.launch()
    }
    
    // execute caffeine shell script
    func ingestCaffeine() {
        let cmd:String = "/bin/sh"
        let task:NSTask = NSTask()
        task.launchPath = cmd
        let sleeptime:Int = 18000
        let arg:String = "[ \"`ps aux | grep \"/usr/bin/caffeinate -t \(sleeptime)\" | grep -v \"grep\"`\" ] && : || /usr/bin/caffeinate -t \(sleeptime) &"
        task.arguments = ["-c", arg]
        task.launch()
    }
    
    // execute halcyon shell script
    func ingestHalcyon() {
        let cmd:String = "/bin/sh"
        let task:NSTask = NSTask()
        task.launchPath = cmd
        let sleeptime:Int = 18000
        let arg:String = "caffeinepid=`ps aux | grep \"/usr/bin/caffeinate -t \(sleeptime)\" | grep -v \"grep\" | tr -s \" \" | cut -d\" \" -f 2`; [ \"`echo $caffeinepid`\" ] && kill $caffeinepid"
        task.arguments = ["-c", arg]
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
        let filename:String = enabled ? "scripts/scpt/AddLoginItem" : "scripts/scpt/DeleteLoginItem";
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

