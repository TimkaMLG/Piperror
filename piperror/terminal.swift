//
//  swift
//
//
//  Created by John on 13.05.2021.
//

import Foundation
import SpriteKit

class terminalNode: SKSpriteNode {
    
    var currentbarrage: BarrageNode!
    class But: ButtonNode {
        var numb = Int()
        var cond = 0
        var lin = Int()
        init(imageNamed name: String, num: Int, line: Int) {
            numb = num
            lin = line
            
            
            super.init(imageNamed: name)
            self.handler = handler1
        }
        
        func handler1() {
            cond = (cond + 1)%2
            if cond == 0 {
                Arr[lin][numb] = 0
                self.texture = SKTexture(imageNamed: "startbutton")
                print(Arr)
            }
            if cond == 1 {
                Arr[lin][numb] = 1
                self.texture = SKTexture(imageNamed: "exitbutton")
                print(Arr)
            }
            
        }
        
        
        required init(coder aDecoder: NSCoder) {
                    fatalError("init(coder:) has not been implemented")
            }
       
    }
    var Button1: But!
    var Button2: But!

    
    init(size: CGSize, i: Int) {
        
        let Button1 = But(imageNamed: "startbutton", num: 0, line: i)
        
        let Button2 = But(imageNamed: "startbutton", num: 1, line: i)
        
        super.init(texture: nil, color: UIColor.clear, size: size)
        
        Button1.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.6)
    
        Button1.position = CGPoint(x: -self.size.width / 3, y: 0)
     
        Button2.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.6)
        
        Button2.position = CGPoint(x: -self.size.width / 6, y: 0)
    
        self.addChild(Button1)
        self.addChild(Button2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

