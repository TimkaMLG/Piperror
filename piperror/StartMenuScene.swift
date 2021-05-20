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

class StartMenuScene: SKScene, SKPhysicsContactDelegate {


override init(size: CGSize) {
super.init(size: size)
}

required init?(coder aDecoder: NSCoder) {
super.init(coder: aDecoder)
}

var startButton : ButtonNode!

override func didMove(to view: SKView) {
self.backgroundColor = .black

startButton = ButtonNode(imageNamed: "playbutton")
startButton.size = CGSize(width: 0.85 * self.size.width, height: 0.20 * self.size.width)
    startButton.position = CGPoint(x: 0.5 * self.size.width, y: 0.8 * self.size.width)
startButton.handler = startButtonAction
self.addChild(startButton)


}

func startButtonAction() {
let LevelMenu = LevelMenuScene(size: self.frame.size)
self.view?.presentScene(LevelMenu)
}
}
