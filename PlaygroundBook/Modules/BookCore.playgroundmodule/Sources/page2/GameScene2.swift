//
//  GameScene.swift
//  BookCore
//
//  Created by Matheus Kulick on 08/04/21.
//

import Foundation
import SpriteKit

class GameScene2: SKScene, SKPhysicsContactDelegate, GameDelegate {

    var character:SKCharacter!
    var faceConfig:[Int] = [-1]
    var testTimer:Timer!
    var labelTeste: SKLabelNode!
    var sceneColor = UIColor(red: 197/255, green: 144/255, blue: 124/255, alpha: 1)
    var calls = 0
    
    override func didMove(to view: SKView) {
        
        scaleMode = .resizeFill
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundColor = sceneColor
        labelTeste = SKLabelNode(text: "TESTANDO")
        labelTeste.position = CGPoint(x: 0, y: -100)
        //addChild(labelTeste)
        
        character = SKCharacter()
        addChild(character)
        
//        testTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (timer) in
//            self.setTexture(expressionT: .frontMouthPucker)
//        })
    }
    
    func setTexture(expressionT: FrontExpression) {
        if(faceConfig.contains(expressionT.rawValue) || expressionT == .frontIdle) {
            character.setFrontTexture(expression: expressionT)
        }
        
    }
    
    func resetScene() {
        self.removeAllChildren()
        self.didMove(to: self.view!)
    }
    
}

protocol GameDelegate {
    func setTexture(expressionT: FrontExpression)
}
