//
//  Views.swift
//  vk_client_test
//
//  Created by admin on 04.08.2022.
//

import UIKit

//@IBDesignable
class MyFrame: UIView {
    
    //@IBInspectable
    
    override func draw(_ rect: CGRect)
    {
        weak var cont = UIGraphicsGetCurrentContext()
        
        let r = CGRect(origin: CGPoint(x: 1, y: 1), size: CGSize(width: self.frame.width - 2, height: self.frame.height - 2))
        let p = UIBezierPath(roundedRect: r, cornerRadius: 15.0).cgPath
        
        cont?.clear(rect)
        //cont?.setFillColor(UIColor.clear.cgColor)
        //cont?.addRect(r)
        //cont?.fillPath()
        
        
        cont?.setStrokeColor(self.tintColor.cgColor)
        cont?.addPath(p)
        cont?.strokePath()
        
        cont?.setFillColor(self.backgroundColor?.cgColor ?? UIColor.white.cgColor)
        cont?.addPath(p)
        cont?.fillPath()
        
        //cont?.drawPath(using: CGPathDrawingMode.stroke)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
        
        self.clearsContextBeforeDrawing = false
        self.isOpaque = false
        
        
    }
    
}
