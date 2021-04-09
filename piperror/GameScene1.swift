//
//  GameScene.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 18.03.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene1 : SKScene {
    
    let shape = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
    
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        shape.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(shape)
    }
    
    
    
}
