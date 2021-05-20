//
//  GameScenePattern.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 13.05.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import SpriteKit
import GameplayKit

var Arr = [[0,0], [0,0], [0,0], [0,0]]
class GameScenePattern : SKScene, SKPhysicsContactDelegate {
    
    var ball:SKSpriteNode!
    var moving:SKNode!
    var gameover = Bool()
    var gameStarted = Bool()
    var line:SKSpriteNode!
    var startButton:ButtonNode!
    var exitButton:ButtonNode!
    let ballCategory: UInt32 = 1 << 0
    let WallCategory: UInt32 = 1 << 1
    let barrierCategory: UInt32 = 1 << 2
    var terminal:terminalNode!
    var currentbarrage: BarrageNode!
    override func didMove(to view: SKView) {
        gameover = false
        gameStarted = false
        
        

        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = .zero
        self.anchorPoint = .zero
        self.backgroundColor = UIColor(#colorLiteral(red: 0.2177612185, green: 0.2177672982, blue: 0.2177640498, alpha: 1))
        line = SKSpriteNode(imageNamed: "line")
        line.size = CGSize(width: self.size.width * 24/90, height: self.size.height * 9 / 16)
        line.position = CGPoint(x: self.size.width / 2, y: self.size.height * 9 / 16)
        line.zPosition = -1
        self.addChild(line)
        moving = SKNode()
        moving.speed = 0
        self.addChild(moving)
        
        
        
        //create start button
        startButton = ButtonNode(imageNamed: "startbutton")
        startButton.size = CGSize(width: 0.12 * self.size.width, height: 0.12 * self.size.width)
        startButton.position = CGPoint(x: 0.1 * self.size.width, y: 0.1 * self.size.width)
        startButton.handler = startButtonAction
        self.addChild(startButton)
        //create exit button
        exitButton = ButtonNode(imageNamed: "exitbutton")
        exitButton.size = CGSize(width: 0.12 * self.size.width, height: 0.12 * self.size.width)
        exitButton.position = CGPoint(x: 0.9 * self.size.width, y: 0.1 * self.size.width)
        exitButton.handler = exitButtonAction
        self.addChild(exitButton)
        
        //create terminal
        terminal = terminalNode(size: CGSize(width: self.size.width, height: self.size.height / 10))
        
        terminal.position = CGPoint(x: self.size.width / 2, y: 3 * startButton.size.height)
        self.addChild(terminal)
        terminal.isHidden = false
        //setup ball
        let ballTexture = SKTexture(imageNamed: "ball.png")
        ballTexture.filteringMode = .nearest
        
        ball = SKSpriteNode(texture: ballTexture)
        ball.size = CGSize(width: 0.033 * self.size.width, height: 0.033 * self.size.width)
        ball.position = CGPoint(x: self.size.width / 2, y: 0.28 * self.size.height)
        
        let ballrotate = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)
        let foreverballrotate = SKAction.repeatForever(ballrotate)
        ball.run(foreverballrotate)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.height / 2.0)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.allowsRotation = false
        
        ball.physicsBody?.categoryBitMask = ballCategory
        ball.physicsBody?.collisionBitMask = WallCategory | barrierCategory
        ball.physicsBody?.contactTestBitMask = WallCategory | barrierCategory
        ball.speed = 0
        self.addChild(ball)
        
        terminal.draw()
    }

    func didBegin(_ contact: SKPhysicsContact) {
        gameover = true
        ball.speed = 0
        moving.speed = 0
        ball.physicsBody?.velocity = .zero
    }
    
    
    
    func startButtonAction() {
        if (!gameStarted){
            gameStarted = true
            moving.speed = 1
            ball.speed = 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 100)
        }
    }
    
    func exitButtonAction() {
        let LevelMenu = LevelMenuScene(size: self.frame.size)
        self.view?.presentScene(LevelMenu)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchPosition = touch!.location(in: self)
        let touchNode = self.nodes(at: touchPosition)
        
        if (!gameStarted){
            if touchNode.contains(startButton) {
                gameStarted = true
                moving.speed = 1
                ball.speed = 1
                ball.physicsBody?.velocity = CGVector(dx: 0, dy: 100)
            }
        }
        else if (gameover){
            let GameOverScene = StartMenuScene(size: self.frame.size)
            self.view?.presentScene(GameOverScene)
        }
    }
}
