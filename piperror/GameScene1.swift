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
    
    let ballCategory: UInt32 = 1 << 0
    let WallCategory: UInt32 = 1 << 1
    let barrierCategory: UInt32 = 1 << 2


    override func didMove(to view: SKView) {
        gameover = false
        gameStarted = false
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = .zero
        self.anchorPoint = .zero
        
        moving = SKNode()
        moving.speed = 0
        self.addChild(moving)
        
        let leftWallTexture = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
        leftWallTexture.size = CGSize(width: self.size.width / 100, height: self.size.height)
        leftWallTexture.position = CGPoint(x: self.size.width / 5 - leftWallTexture.size.width / 2, y: self.size.height / 2)
        
        let rightWallTexture = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
        rightWallTexture.size = CGSize(width: self.size.width / 100, height: self.size.height)
        rightWallTexture.position = CGPoint(x: self.size.width * 4 / 5 + rightWallTexture.size.width / 2, y: self.size.height / 2)
        
        //setup ball
        let ballTexture = SKTexture(imageNamed: "bird.png")
        ballTexture.filteringMode = .nearest
        
        ball = SKSpriteNode(texture: ballTexture)
        ball.size = CGSize(width: self.size.width / 10, height: self.size.width / 10)
        ball.position = CGPoint(x: self.size.width / 2, y: ball.size.height)
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.height / 2.0)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.allowsRotation = false
        
        ball.physicsBody?.categoryBitMask = ballCategory
        ball.physicsBody?.collisionBitMask = WallCategory | barrierCategory
        ball.physicsBody?.contactTestBitMask = WallCategory | barrierCategory
        
        
        /*
        //create the left WallTexture
        let leftWall = SKNode()
        leftWall.position = CGPoint(x: self.size.width / 10, y: self.size.height / 2)
        leftWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width / 5, height: self.size.height))
        leftWall.physicsBody?.isDynamic = false
        leftWall.physicsBody?.categoryBitMask = WallCategory
        leftWall.physicsBody?.contactTestBitMask = ballCategory
        self.addChild(leftWall)
        
        //create the right WallTexture
        let rightWall = SKNode()

        rightWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width / 5, height: self.size.height))
        rightWall.position = CGPoint(x: self.size.width - self.size.width / 10, y: self.size.height / 2)
        rightWall.physicsBody?.isDynamic = false
        rightWall.physicsBody?.categoryBitMask = WallCategory
        self.addChild(rightWall)
        */
        self.addChild(leftWallTexture)
        self.addChild(rightWallTexture)
        self.addChild(ball)
        
        //crate barriers
        
        barrier1 = SKSpriteNode(color: .white, size: CGSize(width: self.size.width / 20, height: self.size.width))
        barrier1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: barrier1.size.width, height: barrier1.size.height))
        barrier1.physicsBody?.isDynamic = false
        barrier1.physicsBody?.allowsRotation = false
        barrier1.position = CGPoint(x: rightWallTexture.position.x, y: 0.4 * self.size.height)
        barrier1.physicsBody?.categoryBitMask = barrierCategory
        barrier1.physicsBody?.contactTestBitMask = ballCategory
        let barrierRotate = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 4)
        let foreverBarrierRotate = SKAction.repeatForever(barrierRotate)
        barrier1.run(foreverBarrierRotate)
        moving.addChild(barrier1)
    }

    func didBegin(_ contact: SKPhysicsContact) {
        gameover = true
        moving.speed = 0
        ball.physicsBody?.velocity = .zero
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (!gameStarted){
            gameStarted = true
            moving.speed = 1
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 100)
        }
        else if (gameover){
            let GameOverScene = StartMenuScene(size: self.frame.size)
            self.view?.presentScene(GameOverScene)
        }
    }
}
