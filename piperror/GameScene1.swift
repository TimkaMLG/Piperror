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
    
    
    let ballCategory: UInt32 = 1 << 0
    let WallCategory: UInt32 = 1 << 1
    let barrierCategory: UInt32 = 1 << 2


    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = .zero
        self.anchorPoint = .zero
        
        let leftWallTexture = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
        leftWallTexture.size = CGSize(width: self.size.width / 5, height: self.size.height)
        leftWallTexture.position = CGPoint(x: leftWallTexture.size.width / 2, y: self.size.height / 2)
        
        let rightWallTexture = SKSpriteNode(color: .white, size: CGSize(width: 100, height: 100))
        rightWallTexture.size = CGSize(width: self.size.width / 5, height: self.size.height)
        rightWallTexture.position = CGPoint(x: self.size.width - rightWallTexture.size.width / 2, y: self.size.height / 2)
        
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
        
        
        ball.physicsBody?.velocity = CGVector(dx: -50, dy: 25)
        //create the left WallTexture
        let leftWall = SKNode()
        leftWall.position = CGPoint(x: leftWallTexture.size.width / 2, y: self.size.height / 2)
        leftWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leftWallTexture.size.width, height: leftWallTexture.size.height))
        leftWall.physicsBody?.isDynamic = false
        leftWall.physicsBody?.categoryBitMask = WallCategory
        self.addChild(leftWall)
        
        //create the right WallTexture
        let rightWall = SKNode()
        rightWall.position = CGPoint(x: self.size.width - rightWallTexture.size.width / 2, y: self.size.height / 2)
        rightWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: rightWallTexture.size.width, height: rightWallTexture.size.height))
        rightWall.physicsBody?.isDynamic = false
        rightWall.physicsBody?.categoryBitMask = WallCategory
        self.addChild(rightWall)
        
        self.addChild(leftWallTexture)
        self.addChild(rightWallTexture)
        self.addChild(ball)
    }

    func didBegin(_ contact: SKPhysicsContact) {
        self.removeAllActions()
        ball.physicsBody?.velocity = .zero
        let GameOverScene = StartMenuScene(size: self.frame.size)
        self.view?.presentScene(GameOverScene)
    }
}
