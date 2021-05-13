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
                self.texture = SKTexture(imageNamed: "but")
                print(Arr)
            }
            if cond == 1 {
                Arr[lin][numb] = 1
                self.texture = SKTexture(imageNamed: "but1")
                print(Arr)
            }
            
        }
        
        
        required init(coder aDecoder: NSCoder) {
                    fatalError("init(coder:) has not been implemented")
            }
       
    }
    var Button1: But!
    var Button2: But!

    
    init(to view: SKView, size: CGSize, i: Int) {
        
        let Button1 = But(imageNamed: "but", num: 0, line: i)
        
        let Button2 = But(imageNamed: "but", num: 1, line: i)
        
        super.init(texture: SKTexture(imageNamed: "but"), color: UIColor.clear, size: size)
        
        Button1.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.09)
    
        Button1.position = CGPoint(x: self.size.width / 6, y: self.size.height / 7)
     
        Button2.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.09)
        
        Button2.position = CGPoint(x: self.size.width / 3, y: self.size.height / 7)
    
        self.addChild(Button1)
        self.addChild(Button2)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

