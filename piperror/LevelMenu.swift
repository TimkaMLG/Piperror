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
    
    var playButton = SKSpriteNode()
    var playLabel = SKLabelNode()
    
    var levels : [SKSpriteNode] = []
    var levels_labels : [SKLabelNode] = []
    
    private func setLevelsButtons() {
        
        let delta_x = (self.size.width - 240)/4
        
        let level1 = SKSpriteNode(color: .white, size: CGSize(width: 80, height: 80))
        level1.name = "level1"
        level1.position = CGPoint(x: 40 + delta_x, y: self.size.height - (40 + delta_x))
        
        let level1label = SKLabelNode(fontNamed: "AvenirNext-Bold")
        level1label.text = "1"
        level1label.fontColor = .black
        level1label.fontSize = CGFloat(40.0)
        level1label.verticalAlignmentMode = .center
        level1label.horizontalAlignmentMode = .center
        
        level1.addChild(level1label)
        self.addChild(level1)
        
        levels.append(level1)
        
        let level2 = SKSpriteNode(color: .white, size: CGSize(width: 80, height: 80))
        level2.name = "level2"
        level2.position = CGPoint(x: 40*3 + delta_x*2, y: self.size.height - (40 + delta_x))
        
        let level2label = SKLabelNode(fontNamed: "AvenirNext-Bold")
        level2label.text = "2"
        level2label.fontColor = .black
        level2label.fontSize = CGFloat(40.0)
        level2label.verticalAlignmentMode = .center
        level2label.horizontalAlignmentMode = .center
        
        
        level2.addChild(level2label)
        self.addChild(level2)
        
        levels.append(level2)
        
        
        let level3 = SKSpriteNode(color: .white, size: CGSize(width: 80, height: 80))
        level3.name = "level3"
        level3.position = CGPoint(x: 40*5 + delta_x*3, y: self.size.height - (40 + delta_x))
        
        let level3label = SKLabelNode(fontNamed: "AvenirNext-Bold")
        level3label.text = "3"
        level3label.fontColor = .black
        level3label.fontSize = CGFloat(40.0)
        level3label.verticalAlignmentMode = .center
        level3label.horizontalAlignmentMode = .center
        
        
        level3.addChild(level3label)
        self.addChild(level3)
        
        levels.append(level3)
    }
    
    override func didMove(to view: SKView) {
        setLevelsButtons()
        self.backgroundColor = .black
        
        let delta_x = (self.size.width - 240)/4
        
        playButton.name = "playButton"
        playButton.size = CGSize(width: self.size.width * 0.75, height: self.size.height * 0.1)
        playButton.color = .white
        playButton.position = CGPoint(x: self.size.width / 2, y: delta_x + playButton.size.height/2)
        
        
        playLabel.text = "Play"
        playLabel.fontColor = .black
        playLabel.fontSize = CGFloat(40.0)
        playLabel.verticalAlignmentMode = .center
        playLabel.horizontalAlignmentMode = .center
        playLabel.fontName = "AvenirNext-Bold"
        
        
        playButton.addChild(playLabel)
        self.addChild(playButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchPosition = touch!.location(in: self)
        let touchNode = self.nodes(at: touchPosition)
        
        
        if touchNode.contains(playButton) && current_level != -1 {
            if current_level == 1 {
                let game_level = GameScene1(size: self.frame.size)
                self.view?.presentScene(game_level)
            } else if current_level == 2 {
                    let game_level = GameScene2(size: self.frame.size)
                    self.view?.presentScene(game_level)
            } else if current_level == 3 {
                let game_level = GameScene3(size: self.frame.size)
                self.view?.presentScene(game_level)
        } else {
            
        }
        }

        for (i, button) in levels.enumerated() {
            if touchNode.contains(button) {
                if current_level != -1 {
                    levels[current_level - 1].color = .white
                }
                current_level = i + 1
                button.color = .gray
                break
            }
        }
    }
}

