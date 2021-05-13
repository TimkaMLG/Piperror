//
//  GameScene.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 18.03.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import SpriteKit
import GameplayKit



class GameScene2 : GameScenePattern {
    
    var barrier1:BarrageNode!
    var barrier2:BarrageNode!
    var barrier3:BarrageNode!
    var barrier4:BarrageNode!
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        let barrierRotate = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 4)
        let foreverBarrierRotate = SKAction.repeatForever(barrierRotate)
        
        barrier1 = BarrageNode(imageName: "barrier",
                               size: CGSize(width: 0.03 * self.size.width, height: 0.225 * self.size.height),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory)
        barrier1.position = CGPoint(x: 0.64 * self.size.width, y: 0.5 * self.size.height)
        barrier1.run(foreverBarrierRotate)
        barrier1.terminal = terminal
        moving.addChild(barrier1)
        
        barrier2 = BarrageNode(imageName: "barrier2",
                               size: CGSize(width: 0.22 * self.size.width, height: 0.05 * self.size.height),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory)
        barrier2.position = CGPoint(x: self.size.width - barrier1.position.x - barrier1.size.width / 2 + barrier2.size.width / 2,
                                    y: 0.37 * self.size.height)
        barrier2.run(foreverBarrierRotate)
        barrier2.terminal = terminal
        moving.addChild(barrier2)
        
        barrier3 = BarrageNode(imageName: "barrier3",
                               size: CGSize(width: 0.26 * self.size.width, height: 0.26 * self.size.width),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory)
        barrier3.position = CGPoint(x: barrier2.position.x - barrier2.size.width / 2 + barrier1.size.width / 2,
                                    y: 0.60 * self.size.height)
        barrier3.run(foreverBarrierRotate)
        barrier3.terminal = terminal
        moving.addChild(barrier3)
        barrier4 = BarrageNode(imageName: "barrier4",
                               size: CGSize(width: barrier3.size.width, height: barrier3.size.width / 2),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory)
        barrier4.position = CGPoint(x: barrier1.position.x,
                                    y: 0.70 * self.size.height)
        barrier4.run(foreverBarrierRotate)
        barrier4.terminal = terminal
        moving.addChild(barrier4)
    }

}
