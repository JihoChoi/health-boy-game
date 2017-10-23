//
//  GenericNode.swift
//  HealthBoy
//
//  Created by Jiho Choi on 2017. 10. 23..
//  Copyright © 2017년 iosteam. All rights reserved.
//

import SpriteKit

struct CollisionBitMask {
    static let Player:UInt32 = 0x00
    static let Flower:UInt32 = 0x01
    static let Brick:UInt32 = 0x02
    
}

enum PlatformType:Int {
    case normalBrick = 0
    case breakableBrick = 1
}

class GenericNode: SKNode {

    
}
