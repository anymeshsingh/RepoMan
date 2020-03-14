//
//  RoundedRectView.swift
//  repository-manager
//
//  Created by Animesh Singh on 10/03/20.
//  Copyright © 2020 Animesh Singh. All rights reserved.
//

import Cocoa

class RoundedRectView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
//        // Size of rounded rectangle
        let rectWidth = self.frame.width
        let rectHeight = self.frame.height
//
//        // Find center of actual frame to set rectangle in middle
        let xf:CGFloat = (self.frame.width  - rectWidth)  / 2
        let yf:CGFloat = (self.frame.height - rectHeight) / 2
        
        let rect = NSRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        let rectanglePath = NSBezierPath(roundedRect: rect, xRadius: 3.0, yRadius: 3.0)

        let fillColor: NSColor = NSColor.lightGray
        rectanglePath.fill()
        fillColor.setFill()
        rectanglePath.fill()
    }
    
}
