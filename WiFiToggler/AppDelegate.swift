//
//  AppDelegate.swift
//  WiFiToggler
//
//  Created by Kazuki Nagamine on 9/20/16.
//  Copyright © 2016 walkingmask. All rights reserved.
//

import Cocoa
import Magnet

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // ⌘ + Shift + F5
        guard let keyCombo = KeyCombo(keyCode: 96, cocoaModifiers: [.CommandKeyMask, .ShiftKeyMask]) else { return }
        let hotKey = HotKey(identifier: "CommandShiftF5",
                            keyCombo: keyCombo,
                            target: self,
                            action: #selector(AppDelegate.tappedHotKey))
        hotKey.register()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        HotKeyCenter.sharedCenter.unregisterAll()
    }
    
    func tappedHotKey() {
        let cmd:String = "/bin/bash"
        let task:NSTask = NSTask()
        task.launchPath = cmd
        task.arguments  = ["/Users/walkingmask/src/peep/peep.sh"]
        task.launch()
        //print("hotKey!!!!")
    }

}

