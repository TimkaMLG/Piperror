//
//  Barrage.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 06.05.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import Foundation
import SpriteKit

class BarrageNode: SKSpriteNode {
    init(imageName: String, size: CGSize, barrageCategory: UInt32, ballCategory: UInt32) {
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: UIColor.black, size: size)
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = barrageCategory
        self.physicsBody?.contactTestBitMask = ballCategory
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let terminal = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
        terminal.position = CGPoint(x: 0, y: 0)
        super.addChild(terminal)
        
    }
}
