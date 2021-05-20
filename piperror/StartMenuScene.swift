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

/* let startButtonTexture = SKTexture(imageNamed: "playbutton")
startButtonTexture.filteringMode = .nearest
*/
startButton = ButtonNode(imageNamed: "playbutton")
startButton.size = CGSize(width: 0.85 * self.size.width, height: 0.20 * self.size.width)
startButton.position = CGPoint(x: 0.5 * self.size.width, y: 0.4 * self.size.width)
startButton.handler = startButtonAction
self.addChild(startButton)


}

func startButtonAction() {
let LevelMenu = LevelMenuScene(size: self.frame.size)
self.view?.presentScene(LevelMenu)
}
/* var startButton = SKSpriteNode()
var buttonLabel = SKLabelNode()
override func didMove(to view: SKView) {
startButton.name = "startButton"
startButton.size = CGSize(width: self.size.width * 0.75, height: self.size.height * 0.1)
startButton.color = .white
startButton.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)


buttonLabel.text = "Start"
buttonLabel.fontColor = .black
buttonLabel.fontSize = CGFloat(40.0)
buttonLabel.verticalAlignmentMode = .center
buttonLabel.horizontalAlignmentMode = .center
buttonLabel.fontName = "AvenirNext-Bold"


startButton.addChild(buttonLabel)

self.backgroundColor = .black

self.addChild(startButton)
}

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
let touch = touches.first
let touchPosition = touch!.location(in: self)
let touchNode = self.nodes(at: touchPosition)

if touchNode.contains(startButton) {
let levelscene = LevelMenuScene(size: self.frame.size)
self.view?.presentScene(levelscene)
}
else {

}
} */
}
