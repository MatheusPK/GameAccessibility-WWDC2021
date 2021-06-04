//
//  GameScene.swift
//  BookCore
//
//  Created by Matheus Kulick on 08/04/21.
//

import Foundation
import SpriteKit


class GameScene4: SKScene, SKPhysicsContactDelegate{

    var labelTeste: SKLabelNode!
    var calls = 0
    var character:SKCharacter!
    var sceneColor = UIColor(red: 197/255, green: 144/255, blue: 124/255, alpha: 1)
    
    
    override func didMove(to view: SKView) {
        
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundColor = sceneColor
        labelTeste = SKLabelNode(text: "Thank you")
        labelTeste.position = CGPoint(x: 0, y: 200)
        character = SKCharacter()
        addChild(character)
        character.setScale(0.3)
        character.animate2()
        addChild(labelTeste)
    }
    
}

