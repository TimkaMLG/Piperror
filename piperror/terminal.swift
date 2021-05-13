//
//  terminal.swift
//  piperror
//
//  Created by Панышев Александр Сергеевич on 13.05.2021.
//  Copyright © 2021 Панышев Александр Сергеевич. All rights reserved.
//

import Foundation
import SpriteKit

class terminalNode: SKSpriteNode {
    
    var currentbarrage: BarrageNode!
    
    init(size: CGSize) {
        
        super.init(texture: .none, color: .white, size: size)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
