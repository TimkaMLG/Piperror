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
        

        
        barrier1 = BarrageNode(imageName: "barrier",
                               size: CGSize(width: 0.03 * self.size.width, height: 0.225 * self.size.height),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory,
                               term: self.terminal,
                               shift: .zero)
        barrier1.position = CGPoint(x: line.position.x + line.size.width / 2, y: 0.5 * self.size.height)

        barrier1.terminal = terminal
        moving.addChild(barrier1)
        
        barrier2 = BarrageNode(imageName: "barrier2",
                               size: CGSize(width: 0.22 * self.size.width, height: 0.05 * self.size.height),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory,
                               term: self.terminal,
                               shift: CGPoint(x: 0.417,y: -0.357))
        barrier2.position = CGPoint(x: self.size.width - barrier1.position.x - barrier1.size.width / 2 + barrier2.size.width/12,
                                    y: 0.37 * self.size.height + barrier2.size.height*5/12)
        
        barrier2.terminal = terminal
        moving.addChild(barrier2)
        
        barrier3 = BarrageNode(imageName: "barrier3",
                               size: CGSize(width: 0.26 * self.size.width, height: 0.26 * self.size.width),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory,
                               term: self.terminal,
                               shift: .zero)
        barrier3.position = CGPoint(x: line.position.x - line.size.width / 2,
                                    y: 0.60 * self.size.height)

        barrier3.terminal = terminal
        moving.addChild(barrier3)
        barrier4 = BarrageNode(imageName: "barrier4",
                               size: CGSize(width: barrier3.size.width, height: barrier3.size.width / 2),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory,
                               term: self.terminal,
                               shift: CGPoint(x: 0, y: 0.39))
        barrier4.position = CGPoint(x: line.position.x + line.size.width / 2,
                                    y: 0.70 * self.size.height-barrier4.size.height*35/90)
        
        barrier4.terminal = terminal
        self.startButton.handler = startButtonAction
        moving.addChild(barrier4)
    }
    
    func startButtonAction() {
        if (!gameStarted){
            barrier1.set_actions()
            barrier2.set_actions()
            barrier3.set_actions()
            barrier4.set_actions()
            gameStarted = true
            moving.speed = 1
            ball.speed = 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 100)
        }
    }
}
