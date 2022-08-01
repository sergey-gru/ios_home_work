//
//  SnakeHead.swift
//  snake_les_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.06.2022.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        self.fillColor = .cyan
        self.strokeColor = .blue
        
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = CollisionCategory.SnakeHead
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = CollisionCategory.Edge | CollisionCategory.Apple
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
