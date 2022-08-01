//
//  SnakeBodyPart.swift
//  snake_les_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.06.2022.
//

import UIKit
import SpriteKit


class SnakeBodyPart: SKShapeNode {
    
    let diametr = 12
    
    init(atPoint point: CGPoint) {
        super.init()
        
        self.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diametr, height: diametr)).cgPath
        self.fillColor = .green
        self.strokeColor = .green
        self.lineWidth = 5
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diametr),
                                         center: CGPoint(x: self.diametr/2, y: self.diametr/2))
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = CollisionCategory.SnakeBody
        self.physicsBody?.collisionBitMask = 0
        //self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody | CollisionCategory.Apple
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
