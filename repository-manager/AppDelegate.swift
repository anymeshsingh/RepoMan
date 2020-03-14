//
//  AppDelegate.swift
//  repository-manager
//
//  Created by Animesh Singh on 09/02/20.
//  Copyright © 2020 Animesh Singh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

//    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
//    let popover = NSPopover()
//    var eventMonitor: EventMonitor?
    var statusItemManager: StatusItemManager!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItemManager = StatusItemManager()
//                if let button = statusItem.button {
//          button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
//          button.action = #selector(togglePopover(_:))
//        }
//        popover.contentViewController = MainViewController.freshController()
//
//        // Monitor event to dismiss window if user click somewhere else
//        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
//          if let strongSelf = self, strongSelf.popover.isShown {
//            strongSelf.closePopover(sender: event)
//          }
//        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

//    @objc func togglePopover(_ sender: Any?) {
//      if popover.isShown {
//        closePopover(sender: sender)
//      } else {
//        showPopover(sender: sender)
//      }
//    }
//
//    func showPopover(sender: Any?) {
//      if let button = statusItem.button {
//        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
//      }
//        eventMonitor?.start()
//
//    }
//
//    func closePopover(sender: Any?) {
//      popover.performClose(sender)
//        eventMonitor?.stop()
//    }
//
//    func showAbout() {
//        guard let popover: NSPopover = popover else { return }
//
//        let storyboard = NSStoryboard(name: "Main", bundle: nil)
//        guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "aboutID")) as? TestViewController else { return }
//
//        popover.contentViewController = vc
//    }

}

