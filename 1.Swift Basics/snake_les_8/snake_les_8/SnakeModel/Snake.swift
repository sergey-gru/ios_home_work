//
//  Snake.swift
//  snake_les_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.06.2022.
//

import UIKit
import SpriteKit


class Snake: SKShapeNode {
    
    var body = [SnakeBodyPart]()
    
    let moveSpeed: CGFloat = 125.0
    var angle: CGFloat = 0.0
    
    init(atPoint point: CGPoint) {
        super.init()
        let head = SnakeHead(atPoint: point)
        self.body.append(head)
        self.addChild(head)
        
        self.addBodyPart()
        self.addBodyPart()
        self.addBodyPart()
    }
    
    func addBodyPart() {
        let part = SnakeBodyPart(atPoint: body[body.count-1].position)
        let c = self.body.count
        
        switch (c - 1) % 3
        {
        case 1:
            part.fillColor = .red
            break
        case 2:
            part.fillColor = .blue
            break
        default:
            part.fillColor = .white
            break
        }
        
        
        self.body.append(part)
        self.addChild(part)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    //перемещение змеи
    func move() {
        if self.body.isEmpty { return }
        
        let head = self.body[0]
        self.moveHead(head)
        
        for index in (1..<self.body.count) {
            let prev = self.body[index-1]
            let cur = self.body[index]
            
            self.moveBodyPart(prev, cur)
        }
        
    }
    
    func moveHead(_ head: SnakeBodyPart) {
        
        let dx = moveSpeed * sin(angle)
        let dy = moveSpeed * cos(angle)
        
        let pos = CGPoint(x: head.position.x + dx,
                          y: head.position.y + dy)
        
        let act = SKAction.move(to: pos, duration: 1.0)
        head.run(act)
                
    }
    
    func moveBodyPart(_ prev: SnakeBodyPart, _ cur: SnakeBodyPart) {
        
        let act = SKAction.move(to: prev.position, duration: 0.1)
        cur.run(act)
    }

    
    
    
    //поворот змеи
    func moveClockwise() {
        angle += CGFloat(Double.pi/2)
        if angle >= 2 * Double.pi {
            angle -= 2 * Double.pi
        }
    }
    func moveCounterClockwise() {
        angle -= CGFloat(Double.pi/2)
        if angle <= -2 * Double.pi {
            angle += 2 * Double.pi
        }
    }
    
}
