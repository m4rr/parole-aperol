//
//  AppDelegate.swift
//  wifi192
//
//  Created by Marat Saytakov on 31.10.2019.
//  Copyright © 2019 saytakov. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  var window: NSWindow!

  let cnt = Connector()

  func applicationDidFinishLaunching(_ aNotification: Notification) {

    // Create the SwiftUI view that provides the window contents.
//    let contentView = ContentView()

    // Create the window and set the content view. 
    window = NSWindow(
      contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
      styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
      backing: .buffered, defer: false)
    window.center()
    window.setFrameAutosaveName("Main Window")
    window.contentView = cnt.view // NSHostingView(rootView: contentView)
    window.makeKeyAndOrderFront(nil)
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

}

