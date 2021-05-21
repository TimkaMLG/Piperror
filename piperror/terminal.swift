//
//  swift
//
//
//  Created by John on 13.05.2021.
//

import Foundation
import SpriteKit

// class of terminal to interaction with user
class terminalNode: SKSpriteNode {
    var currentbarrage: BarrageNode!
    //modified class Button for buttons in terminal
    class But: ButtonNode {
        weak var termNode: terminalNode!
        var numb = Int()
        //initialization of buttons
        init(imageNamed name: String, num: Int) {
            numb = num
            super.init(imageNamed: name)
            self.handler = handler1
        }
        
        //handler of interactions
        func handler1() {
            if termNode.currentbarrage.Arr[numb] == 0 {
                self.texture = SKTexture(imageNamed: "nothing")
            }
            if termNode.currentbarrage.Arr[numb] == 1 {
                self.texture = SKTexture(imageNamed: "right")
                
            }
            if termNode.currentbarrage.Arr[numb] == 2 {
                self.texture = SKTexture(imageNamed: "left")
            }
            termNode.currentbarrage.Arr[numb] = (termNode.currentbarrage.Arr[numb] + 1)%3
            termNode.currentbarrage.set_actions()
            termNode.draw()
            print(termNode.currentbarrage.Arr)
        }
        //function to transport values of lacal Array to array of currentbarrage
        
        func set_curbar(curbar: BarrageNode) {
            curbar.Arr[numb] = termNode.currentbarrage.Arr[numb]
        }
        
        required init(coder aDecoder: NSCoder) {
                    fatalError("init(coder:) has not been implemented")
            }
       
    }
    
    var Button1: But!
    var Button2: But!
    var Button3: But!
    var Button4: But!
    var Button5: But!
    
    //initialization of terminal
    init(size: CGSize) {
        //creating buttons
        
        Button1 = But(imageNamed: "nothing", num: 0)
        Button2 = But(imageNamed: "nothing", num: 1)
        Button3 = But(imageNamed: "nothing", num: 2)
        Button4 = But(imageNamed: "nothing", num: 3)
        Button5 = But(imageNamed: "nothing", num: 4)
        
        super.init(texture: nil, color: UIColor.clear, size: size)
        
        Button1.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.6)
        Button1.position = CGPoint(x: -self.size.width / 3, y: 0)
        Button2.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.6)
        Button2.position = CGPoint(x: -self.size.width / 6, y: 0)
        Button3.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.6)
        Button3.position = CGPoint(x: 0, y: 0)
        Button4.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.6)
        Button4.position = CGPoint(x: self.size.width / 6, y: 0)
        Button5.size = CGSize(width: self.size.width * 0.16, height: self.size.height * 0.6)
        Button5.position = CGPoint(x: self.size.width / 3, y: 0)
        Button1.termNode = self
        Button2.termNode = self
        Button3.termNode = self
        Button4.termNode = self
        Button5.termNode = self
        
        self.addChild(Button1)
        self.addChild(Button2)
        self.addChild(Button3)
        self.addChild(Button4)
        self.addChild(Button5)
    }
    
    // function to connect currentbarrage with local values
    func set_bar() {
        self.Button1.set_curbar(curbar: currentbarrage)
    }
    
    //function to update sprites of buttons
    func draw() {
        if Button1 != nil {
            switch self.currentbarrage.Arr[0]  {
                case 0: self.Button1.texture = SKTexture(imageNamed: "nothing")
                case 1: self.Button1.texture = SKTexture(imageNamed: "right")
                case 2: self.Button1.texture = SKTexture(imageNamed: "left")
                default: self.Button1.texture = SKTexture(imageNamed: "nothing")
            }
        }
        if Button2 != nil {
            //print(self.currentbarrage.Arr[1])
            switch self.currentbarrage.Arr[1]  {
                case 0: self.Button2.texture = SKTexture(imageNamed: "nothing")
                case 1: self.Button2.texture = SKTexture(imageNamed: "right")
                case 2: self.Button2.texture = SKTexture(imageNamed: "left")
                default: self.Button2.texture = SKTexture(imageNamed: "nothing")
            }
        }
        if Button3 != nil {
            switch self.currentbarrage.Arr[2]  {
                case 0: self.Button3.texture = SKTexture(imageNamed: "nothing")
                case 1: self.Button3.texture = SKTexture(imageNamed: "right")
                case 2: self.Button3.texture = SKTexture(imageNamed: "left")
                default: self.Button3.texture = SKTexture(imageNamed: "nothing")
            }
        }
        if Button4 != nil {
            switch self.currentbarrage.Arr[3]  {
                case 0: self.Button4.texture = SKTexture(imageNamed: "nothing")
                case 1: self.Button4.texture = SKTexture(imageNamed: "right")
                case 2: self.Button4.texture = SKTexture(imageNamed: "left")
                default: self.Button4.texture = SKTexture(imageNamed: "nothing")
            }
        }
        if Button5 != nil {
            switch self.currentbarrage.Arr[4]  {
                case 0: self.Button5.texture = SKTexture(imageNamed: "nothing")
                case 1: self.Button5.texture = SKTexture(imageNamed: "right")
                case 2: self.Button5.texture = SKTexture(imageNamed: "left")
                default: self.Button5.texture = SKTexture(imageNamed: "nothing")
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

