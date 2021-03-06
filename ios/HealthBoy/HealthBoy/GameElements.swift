//
//  GameElements.swift
//  HealthBoy
//
//  Created by Jiho Choi on 2017. 10. 23..
//  Copyright © 2017년 iosteam. All rights reserved.
//

import Foundation

import SpriteKit

extension GameScene {
    
    
    // background
    func createBackground() -> SKNode {
        let background = SKNode()
        let spacing = 64 * scaleFactor
        
        // for index in 0 ... 19 {
        for index in 0 ... 4 {
                let node = SKSpriteNode(imageNamed: String(format: "Background%02d", index + 1))
            node.setScale(scaleFactor)
            node.anchorPoint = CGPoint(x: 0.5, y:0)
            node.position = CGPoint(x: self.size.width / 2, y: spacing * CGFloat(index))
            
            background.addChild(node)
        }
        return background
    }
    
        
        
    // midground cloud
    func createMidground() -> SKNode {
        let midgroundNode = SKNode()
        var anchor: CGPoint!
        var xPos: CGFloat!
        
        for index in 0 ... 9 {
            var name: String
            
            let randomNumber = arc4random() % 2
            if randomNumber > 0 {
                name = "cloudLeft"
                anchor = CGPoint(x: 0, y: 0.5)
                xPos = 0
            } else {
                name = "cloudRight"
                anchor = CGPoint(x: 1, y: 0.5)
                xPos = self.size.width
            }
            
            let cloudNode = SKSpriteNode(imageNamed: name)
            cloudNode.anchorPoint = anchor
            cloudNode.position = CGPoint(x: xPos, y: 500 * CGFloat(index))
            
            midgroundNode.addChild(cloudNode)
        }
        return midgroundNode
    }
    
    
    func createPlayer() -> SKNode {
        let playerNode = SKNode()
        playerNode.position = CGPoint(x: self.size.width / 2, y: 80)
        
        let sprite = SKSpriteNode(imageNamed: "Player")
        playerNode.addChild(sprite)
        
        playerNode.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        playerNode.physicsBody?.isDynamic = false
        playerNode.physicsBody?.allowsRotation = false
        playerNode.physicsBody?.restitution = 1
        playerNode.physicsBody?.friction = 0
        playerNode.physicsBody?.angularDamping = 0
        playerNode.physicsBody?.linearDamping = 0
        playerNode.physicsBody?.usesPreciseCollisionDetection = true
        
        
        playerNode.physicsBody?.categoryBitMask = CollisionBitMask.Player
        playerNode.physicsBody?.collisionBitMask = 0
        playerNode.physicsBody?.contactTestBitMask = CollisionBitMask.Flower | CollisionBitMask.Brick
        
        
        return playerNode
    }
    
    func createPlatformAtPosition(position:CGPoint, ofType type: PlatformType) -> PlatformNode {
        let node = PlatformNode()
        let position = CGPoint(x: position.x * scaleFactor, y: position.y)
        node.position = position
        node.name = "PALTFORMNODE"
        node.platformType = type
        
        var sprite: SKSpriteNode
        if (type == PlatformType.normalBrick) {
            sprite = SKSpriteNode(imageNamed: "Platform")
        } else {
            sprite = SKSpriteNode(imageNamed: "PlatformBreak")
            
        }
        
        node.addChild(sprite)
        
        // node.physicsBody = SKPhysicsBody(sprite.size)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionBitMask.Brick
        node.physicsBody?.contactTestBitMask = 0
        
        return node
    }
    


    
    
}



