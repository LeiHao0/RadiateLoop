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
        
        for i in 1...360 {
            // set diff color
            let b = i > 120 && i < 200 || i > 240 && i < 350
            let color = b ? UIColor.greenColor() : UIColor.lightGrayColor()
            drawLine(i, color:color, c: center)
        }
    }
    
    func drawLine(i:Int, color:UIColor , c:Center) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Bezier Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, c.x, c.y)
        CGContextRotateCTM(context, CGFloat(i) * CGFloat(M_PI) / 180)
        
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(0, c.y))
        bezierPath.addLineToPoint(CGPointMake(0, c.y - 16))
        color.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        CGContextRestoreGState(context)
    }

}
