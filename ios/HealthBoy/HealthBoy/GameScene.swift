//
//  GameScene.swift
//  HealthBoy
//
//  Created by Jiho Choi on 2017. 10. 23..
//  Copyright © 2017년 iosteam. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion


class GameScene: SKScene {

    var background: SKNode!
    var midground: SKNode!
    var foreground: SKNode!
    
    var hud: SKNode!
    
    var player: SKNode!
    var scaleFactor: CGFloat!
    
    // var startButton = SKSpriteNode(imageName: "TapToStart")
    var endOfGamePosition = 0
    
    let motionManager = CMMotionManager()
    
    var xAcceleration: CGFloat = 0.0
    
    var scoreLabel: SKLabelNode!
    var flowerLabel: SKLabelNode!
    
    var playersMaxY: Int!
    var gameOver = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        backgroundColor = SKColor.white
        
        scaleFactor = self.size.width / 320
        
        // background
        background = createBackground()
        addChild(background)
    
        
        // midground
        midground = createMidground()
        addChild(midground)
        
        
        foreground = SKNode()
        addChild(foreground)

        player = createPlayer()
        foreground.addChild(player)
        
        //let platform = createPlatformAtPosition(CGPoint(x:160, y:320), ofType: PlatformType.normalBrick)
        let platform = createPlatformAtPosition(position: CGPoint(x:160, y:320), ofType: PlatformType.normalBrick)
        foreground.addChild(platform)
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
