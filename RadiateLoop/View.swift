//
//  View.swift
//  RadiateLoop
//
//  Created by Artwalk on 12/10/14.
//  Copyright (c) 2014 Artwalk. All rights reserved.
//

import UIKit

class View: UIView {

    struct Center {
        var x:CGFloat
        var y:CGFloat
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let center = Center(x: self.frame.width/2, y: self.frame.height/2)
        
        // d is degree, the increment is 2.5°
        for var d:CGFloat = 0.0; d < 360.0; d += 2.5 {
            // set diff color
            let b = d > 120 && d < 200 || d > 240 && d < 350
            let color = b ? UIColor.greenColor() : UIColor.lightGrayColor()
            drawLine(d, color:color, c: center)
        }
    }
    
    func drawLine(d:CGFloat, color:UIColor , c:Center) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Bezier Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, c.x, c.y)
        CGContextRotateCTM(context, d * CGFloat(M_PI) / 180)
        
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(0, c.y))
        bezierPath.addLineToPoint(CGPointMake(0, c.y - 16))
        color.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        CGContextRestoreGState(context)
    }

}
