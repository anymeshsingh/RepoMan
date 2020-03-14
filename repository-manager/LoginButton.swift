//
//  LoginButton.swift
//  repository-manager
//
//  Created by Animesh Singh on 10/02/20.
//  Copyright © 2020 Animesh Singh. All rights reserved.
//

import AppKit

public class LoginButton: NSButton {
 
    var darkColor = NSColor(red: 0.59, green: 0.84, blue: 0.27, alpha: 1.0)
    var lightColor = NSColor(calibratedRed: 0.304, green: 0.601, blue: 0.294, alpha: 1)
 
    public override func draw(_ dirtyRect: NSRect) {
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

        var fillColor: NSColor
        rectanglePath.fill()
        if self.isHighlighted {
            fillColor = self.lightColor
        } else {
            fillColor = self.darkColor
        }
        fillColor.setFill()
        rectanglePath.fill()


        let textRect = NSRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let textTextContent = self.title
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes : [ NSAttributedString.Key : Any ] = [
          .font: NSFont(name: "Montserrat-Bold", size: NSFont.systemFontSize)!,
          .foregroundColor: NSColor.white,
          .paragraphStyle: textStyle
        ]

        let textTextHeight: CGFloat = textTextContent.boundingRect(with: NSSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes as [NSAttributedString.Key : Any]).height
        let textTextRect: NSRect = NSRect(x: 0, y: -3 + ((textRect.height - textTextHeight) / 2), width: textRect.width, height: textTextHeight)
        NSGraphicsContext.saveGraphicsState()
        textRect.clip()
        textTextContent.draw(in: textTextRect.offsetBy(dx: 0, dy: 3), withAttributes: textFontAttributes as [NSAttributedString.Key : Any])
        NSGraphicsContext.restoreGraphicsState()
    }
}
