//
//  StartMenuScene.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 18.03.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import Foundation
import SpriteKit

class LevelMenuScene: SKScene {
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var current_level = -1

    var playButton : ButtonNode!
    var exitButton : ButtonNode!
    var level1 : ButtonNode!
    var level2 : ButtonNode!
    

    func exitButtonAction() {
    let StartMenu = StartMenuScene(size: self.frame.size)
    self.view?.presentScene(StartMenu)
    }
    
    func level1Action() {
        current_level = 1
        level2.texture = SKTexture(imageNamed: "level2_0")
        level1.texture = SKTexture(imageNamed: "level1_1")
    }
    
    func level2Action() {
        current_level = 2
        level2.texture = SKTexture(imageNamed: "level2_1")
        level1.texture = SKTexture(imageNamed: "level1_0")
    }
    
    func playButtonAction() {
        if current_level == 1 {
            let game_level = GameScene1(size: self.frame.size)
            self.view?.presentScene(game_level)
        } else if current_level == 2 {
                let game_level = GameScene2(size: self.frame.size)
                self.view?.presentScene(game_level)
        } else {
        
        }
    }
    
    
    override func didMove(to view: SKView) {

    self.backgroundColor = UIColor(#colorLiteral(red: 0.2177612185, green: 0.2177672982, blue: 0.2177640498, alpha: 1))
    
    playButton = ButtonNode(imageNamed: "startbutton")
    playButton.size = CGSize(width: 0.3 * self.size.width, height: 0.3 * self.size.width)
    playButton.position = CGPoint(x: 0.7 * self.size.width, y: 0.4 * self.size.width)
    playButton.texture = SKTexture(imageNamed: "startbutton")
    playButton.handler = playButtonAction
    self.addChild(playButton)

    exitButton = ButtonNode(imageNamed: "exitbutton")
    exitButton.size = CGSize(width: 0.3 * self.size.width, height: 0.3 * self.size.width)
    exitButton.position = CGPoint(x: 0.3 * self.size.width, y: 0.4 * self.size.width)
    exitButton.texture = SKTexture(imageNamed: "exitbutton")
    exitButton.handler = exitButtonAction
    self.addChild(exitButton)
    
    level1 = ButtonNode(imageNamed: "level1_0")
    level1.size = CGSize(width: 0.3 * self.size.width, height: 0.3 * self.size.width)
        level1.position = CGPoint(x: 0.25 * self.size.width, y: 1.2 * self.size.width)
    level1.texture = SKTexture(imageNamed: "level1_0")
    level1.handler = level1Action
    self.addChild(level1)
        
    level2 = ButtonNode(imageNamed: "level2_0")
    level2.size = CGSize(width: 0.3 * self.size.width, height: 0.3 * self.size.width)
        level2.position = CGPoint(x: 0.75 * self.size.width, y: 1.2 * self.size.width)
    level2.texture = SKTexture(imageNamed: "level2_0")
    level2.handler = level2Action
    self.addChild(level2)
    
    }
}
