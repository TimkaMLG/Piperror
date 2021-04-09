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
    
    
    
    let wall1 = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
    let wall2 = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
    let ball = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        
        wall1.size = CGSize(width: self.size.width / 5, height: self.size.height)
        wall1.position = CGPoint(x: wall1.size.width / 2, y: self.size.height / 2)
        wall2.size = CGSize(width: self.size.width / 5, height: self.size.height)
        wall2.position = CGPoint(x: self.size.width - wall2.size.width / 2, y: self.size.height / 2)
        ball.size = CGSize(width: self.size.width / 10, height: self.size.width / 10)
        ball.position = CGPoint(x: self.size.width / 2, y: ball.size.height)
        self.addChild(wall1)
        self.addChild(wall2)
        self.addChild(ball)
    }

}
