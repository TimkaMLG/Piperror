//
// StartMenuScene.swift
// piperror
//
// Created by Панышев Александр Сергеевич on 18.03.2021.
// Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

// стартовое меню
class StartMenuScene: SKScene, SKPhysicsContactDelegate {

    
    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var startButton : ButtonNode!
    var gamename : SKSpriteNode!
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(#colorLiteral(red: 0.2177612185, green: 0.2177672982, blue: 0.2177640498, alpha: 1))
        // create gamename title
        gamename = SKSpriteNode(imageNamed: "gamename")
        gamename.size = CGSize(width: 0.7 * self.size.width, height: 0.0625 * self.size.height)
        gamename.position = CGPoint(x: 0.5 * self.size.width, y: 0.75 * self.size.height)
        self.addChild(gamename)
        
        // create startbutton
        startButton = ButtonNode(imageNamed: "play")
        startButton.size = CGSize(width: 0.28 * self.size.width, height: 0.0625 * self.size.height)
        startButton.position = CGPoint(x: 0.5 * self.size.width, y: 0.625 * self.size.height)
        startButton.handler = startButtonAction
        self.addChild(startButton)


    }

    // start button action
    func startButtonAction() {
        let LevelMenu = GameScene2(size: self.frame.size)
        self.view?.presentScene(LevelMenu)
        }
}
