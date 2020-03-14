//
//  CustomTextField.swift
//  repository-manager
//
//  Created by Animesh Singh on 10/02/20.
//  Copyright © 2020 Animesh Singh. All rights reserved.
//

import AppKit

class CustomTextField: NSTextField {
//    public override func draw(_ dirtyRect: NSRect) {
//        super.draw(dirtyRect)
           var darkColor = NSColor(calibratedRed: 0.201, green: 0.404, blue: 0.192, alpha: 1)
           var lightColor = NSColor(calibratedRed: 0.304, green: 0.601, blue: 0.294, alpha: 1)
        
           public override func draw(_ dirtyRect: NSRect) {
               super.draw(dirtyRect)
            
               let rectanglePath = NSBezierPath(rect: NSRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            
               var fillColor: NSColor
               var strokeColor: NSColor
               rectanglePath.fill()
               if self.isHighlighted {
                   strokeColor = self.darkColor
                   fillColor = self.lightColor
               } else {
                   strokeColor = self.lightColor
                   fillColor = self.darkColor
               }
            
               strokeColor.setStroke()
               rectanglePath.lineWidth = 5
               rectanglePath.stroke()
               fillColor.setFill()
               rectanglePath.fill()
            
            
//               let textRect = NSRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
//               let textStyle = NSMutableParagraphStyle()
//               textStyle.alignment = .center
//               let textFontAttributes : [ NSAttributedString.Key : Any ] = [
//                 .font: NSFont(name: "Montserrat-Bold", size: NSFont.systemFontSize)!,
//                 .foregroundColor: NSColor.white,
//                 .paragraphStyle: textStyle
//               ]
//               
//               let textTextHeight: CGFloat = textTextContent.boundingRect(with: NSSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes as [NSAttributedString.Key : Any]).height
//               let textTextRect: NSRect = NSRect(x: 0, y: -3 + ((textRect.height - textTextHeight) / 2), width: textRect.width, height: textTextHeight)
//               NSGraphicsContext.saveGraphicsState()
//               textRect.clip()
//               textTextContent.draw(in: textTextRect.offsetBy(dx: 0, dy: 3), withAttributes: textFontAttributes as [NSAttributedString.Key : Any])
//               NSGraphicsContext.restoreGraphicsState()
    }
}
