//
//  Button.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 30.04.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import Foundation
import SpriteKit

class ButtonNode: SKSpriteNode {





    var handler: (() -> Void)?
    
    init(imageNamed name: String) {
        let texture = SKTexture(imageNamed: name)
        super.init(texture: texture, color: UIColor.black, size: texture.size())
        isUserInteractionEnabled = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    weak var currentTouch: UITouch?
    

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        handler?()
    }
    
}
