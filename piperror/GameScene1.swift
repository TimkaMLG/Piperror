//
//  GameScene.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 18.03.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene1 : SKScene, SKPhysicsContactDelegate {
    
    var ball:SKSpriteNode!
    var moving:SKNode!
    var gameover = Bool()
    var gameStarted = Bool()
    var barrier1:SKSpriteNode!
    var barrier2:BarrageNode!
    var startButton:SKSpriteNode!
    var exitButton:ButtonNode!
    let ballCategory: UInt32 = 1 << 0
    let WallCategory: UInt32 = 1 << 1
    let barrierCategory: UInt32 = 1 << 2


    override func didMove(to view: SKView) {
        gameover = false
        gameStarted = false
        
        

        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = .zero
        self.anchorPoint = .zero
        self.backgroundColor = UIColor(#colorLiteral(red: 0.2177612185, green: 0.2177672982, blue: 0.2177640498, alpha: 1))
        moving = SKNode()
        moving.speed = 0
        self.addChild(moving)
        
        //create start button
        let startButtonTexture = SKTexture(imageNamed: "startbutton")
        startButtonTexture.filteringMode = .nearest
        
        startButton = SKSpriteNode(texture: startButtonTexture)
        startButton.size = CGSize(width: 0.12 * self.size.width, height: 0.12 * self.size.width)
        startButton.position = CGPoint(x: 0.1 * self.size.width, y: 0.1 * self.size.width)
        
        self.addChild(startButton)
        //create exit button
        let exitButtonTexture = SKTexture(imageNamed: "exitbutton")
        exitButtonTexture.filteringMode = .nearest
        
        exitButton = ButtonNode(imageNamed: "exitbutton")
        exitButton.size = CGSize(width: 0.12 * self.size.width, height: 0.12 * self.size.width)
        exitButton.position = CGPoint(x: 0.9 * self.size.width, y: 0.1 * self.size.width)
        exitButton.handler = exitButtonAction
        self.addChild(exitButton)
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
        
        //create barriers
        //barrier 1
        let barrierTexture = SKTexture(imageNamed: "barrier")
        barrierTexture.filteringMode = .nearest
        barrier1 = SKSpriteNode(texture: barrierTexture)
        barrier1.size = CGSize(width: 0.03 * self.size.width, height: 0.225 * self.size.height)
        barrier1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: barrier1.size.width, height: barrier1.size.height))
        barrier1.physicsBody?.isDynamic = false
        barrier1.physicsBody?.allowsRotation = false
        barrier1.position = CGPoint(x: 0.64 * self.size.width, y: 0.5 * self.size.height)
        barrier1.physicsBody?.categoryBitMask = barrierCategory
        barrier1.physicsBody?.contactTestBitMask = ballCategory
        
        let barrierRotate = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 4)
        let foreverBarrierRotate = SKAction.repeatForever(barrierRotate)
        barrier1.run(foreverBarrierRotate)
        
        moving.addChild(barrier1)
        
        //barrier 2
        barrier2 = BarrageNode(imageName: "barrier2",
                               size: CGSize(width: 0.22 * self.size.width, height: 0.05 * self.size.height),
                               barrageCategory: barrierCategory,
                               ballCategory: ballCategory)
        
        barrier2.position = CGPoint(x: self.size.width - barrier1.position.x - barrier1.size.width / 2 + barrier2.size.width / 2,
                                    y: 0.37 * self.size.height)

        barrier2.run(foreverBarrierRotate)
        
        moving.addChild(barrier2)
        
    }

    func didBegin(_ contact: SKPhysicsContact) {
        gameover = true
        ball.speed = 0
        moving.speed = 0
        ball.physicsBody?.velocity = .zero
    }
    
    func exitButtonAction() {
        print("NIHUA")
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
