//
//  GameScene.swift
//  snake_les_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.06.2022.
//

import SpriteKit
import GameplayKit

struct CollisionCategory {
    
    static let SnakeBody: UInt32 = 0x1 << 0 //1
    static let SnakeHead: UInt32 = 0x1 << 1 //2
    static let Apple: UInt32 = 0x1 << 2 //4
    static let Edge: UInt32 = 0x1 << 3 //8
    
}


class GameScene: SKScene {
    
    var snake: Snake?
    var fieldRect: CGRect?
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.black
        
        let bt1 = createButton()
        bt1.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        bt1.name = "counterClockwiseButton"
        self.addChild(bt1)
        
        
        let bt2 = createButton()
        bt2.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30)
        bt2.name = "counterClockButton"
        self.addChild(bt2)
        
        
        self.fieldRect = CGRect(x: self.frame.minX, y: self.frame.minY + 100, width: self.frame.width, height: self.frame.height - 100)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.fieldRect!)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = CollisionCategory.Edge
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.contactTestBitMask = CollisionCategory.SnakeHead
        
        view.showsPhysics = true
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        
        self.initSnake()
        self.createApple()
        
    }
    
    func initSnake() {
        self.snake?.removeFromParent()
        
        self.snake = Snake(atPoint: CGPoint(x: self.view!.scene!.frame.midX, y: self.view!.scene!.frame.midY))
        self.addChild(self.snake!)
    }
    
    func createButton() -> SKShapeNode {
        let bt = SKShapeNode()
        bt.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        bt.fillColor = .gray
        bt.strokeColor = .gray
        bt.lineWidth = 10
        
        return bt
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchNode.name == "counterClockwiseButton" || touchNode.name == "counterClockButton" else {
                      return
                  }
            
            touchNode.fillColor = .green
            
            if touchNode.name == "counterClockButton" {
                snake!.moveClockwise()
            } else if touchNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            }
        }
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,
                  touchNode.name == "counterClockwiseButton" || touchNode.name == "counterClockButton" else {
                      return
                  }
            
            touchNode.fillColor = .gray
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
    func getRandom(_ min: CGFloat, _ max: CGFloat) -> CGFloat {
        
        let r = CGFloat(arc4random_uniform(UInt32(max - min)))
        return min + r
    }
    
    func createApple() {
        
        let x = self.getRandom(self.fieldRect!.minX + 5, self.fieldRect!.maxX - 5)
        let y = self.getRandom(self.fieldRect!.minY + 5, self.fieldRect!.maxY - 5)
        
        let apple = Apple(position: CGPoint(x: x, y: y))
        self.addChild(apple)
    }
    
}


extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let collisionObject = (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) & ~CollisionCategory.SnakeHead
        
        switch collisionObject {
        case CollisionCategory.Apple:
            
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodyPart()
            apple!.removeFromParent()
            
            self.createApple()
            
        case CollisionCategory.Edge:
            self.initSnake()
            break
            
        case CollisionCategory.SnakeBody:
            break
            
        default:
            break
        }
        
        
    }
    
}
