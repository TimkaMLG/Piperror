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
    var i = Int()
    var handler: (() -> Void)?
    var terminal:terminalNode!
    var Arr = [2,0,2,1,0]
    
    init(imageName: String, size: CGSize, barrageCategory: UInt32, ballCategory: UInt32, term: terminalNode, shift: CGPoint) {
        
        let texture = SKTexture(imageNamed: imageName)
        let barrage = SKSpriteNode(texture: texture, color: .clear, size: size)
        
        super.init(texture: nil, color: .clear, size: size)
        barrage.position = CGPoint(x: shift.x * self.size.width, y: shift.y * self.size.height)
        barrage.physicsBody = SKPhysicsBody(texture: barrage.texture!, size: barrage.size)
        barrage.physicsBody?.isDynamic = false
        barrage.physicsBody?.allowsRotation = false
        barrage.physicsBody?.categoryBitMask = barrageCategory
        barrage.physicsBody?.contactTestBitMask = ballCategory | barrageCategory
        self.addChild(barrage)
        isUserInteractionEnabled = true
        terminal = term
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        terminal.currentbarrage = self
        
        self.set_actions()
    }
    
    func set_actions() {
        var action: [SKAction] = []
        for i in 0...4 {
            if Arr[i] == 0 {
                action.append(SKAction.rotate(byAngle: CGFloat(0), duration: 1))
            }
            if Arr[i] == 1 {
                action.append(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1))
            }
            if Arr[i] == 2 {
                action.append(SKAction.rotate(byAngle: CGFloat(-Double.pi), duration: 1))
            }
        }
        print(action)
        self.run(SKAction.repeatForever(SKAction.sequence(action)))
    }
}