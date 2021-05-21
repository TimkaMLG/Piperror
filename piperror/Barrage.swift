//
//  Barrage.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 06.05.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import Foundation
import SpriteKit

// шаблон для препятстствия
class BarrageNode: SKSpriteNode {
    
    var handler: (() -> Void)?
    var terminal:terminalNode! // terminal
    var Arr = [0,0,0,0,0] // массив поведения 
    var i = Int()
    
    // инициализатор
    init(imageName: String, size: CGSize, barrageCategory: UInt32, ballCategory: UInt32, term: terminalNode, shift: CGPoint) {
        
        let texture = SKTexture(imageNamed: imageName)
        let barrage = SKSpriteNode(texture: texture, color: .clear, size: size)
        
        super.init(texture: nil, color: .clear, size: size)
        barrage.position = CGPoint(x: shift.x * self.size.width, y: shift.y * self.size.height)
        barrage.physicsBody = SKPhysicsBody(texture: barrage.texture!, size: barrage.size)
        barrage.physicsBody?.isDynamic = false
        barrage.physicsBody?.allowsRotation = false
        barrage.physicsBody?.categoryBitMask = barrageCategory
        barrage.physicsBody?.contactTestBitMask = ballCategory | barrageCategory
        self.addChild(barrage)
        isUserInteractionEnabled = true
        terminal = term
    }
    
    // деструктор
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //  действия при нажатии на преапятствие
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (terminal.isHidden) {
            terminal.isHidden = false
        }
        terminal.currentbarrage = self
        terminal.set_bar()
        
        
        self.set_actions()
        terminal.draw()
        print(self.Arr)
    }
    
    // установка поведения барьера
    func set_actions() {
        var action: [SKAction] = []
        for i in 0...4 {
            if Arr[i] == 0 {
                action.append(SKAction.rotate(byAngle: CGFloat(0), duration: 2))
            }
            if Arr[i] == 2 {
                action.append(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2))
            }
            if Arr[i] == 1 {
                action.append(SKAction.rotate(byAngle: CGFloat(-Double.pi), duration: 2))
            }
        }
        
        self.run(SKAction.repeatForever(SKAction.sequence(action)))
    }
}
