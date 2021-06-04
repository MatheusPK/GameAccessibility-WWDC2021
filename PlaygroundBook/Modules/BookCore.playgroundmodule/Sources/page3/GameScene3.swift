//
//  GameScene.swift
//  BookCore
//
//  Created by Matheus Kulick on 08/04/21.
//

import Foundation
import SpriteKit
import UIKit
import PlaygroundSupport


class GameScene3: SKScene, SKPhysicsContactDelegate, GameDelegate2 {
    var character:SKCharacter!
    var labelTeste: SKLabelNode!
    var field: SKField!
    var background: SKSpriteNode!
    var sceneColor = UIColor(red: 197/255, green: 144/255, blue: 124/255, alpha: 1)
    var fieldColor = UIColor(red: 148/255, green: 95/255, blue: 81/255, alpha: 1)
    var backgroundGameNode:SKSpriteNode!
    let backgroundSound = SKAudioNode(fileNamed: "yourTurn.mp3")
    let backgroundTexture = SKTexture(imageNamed: "backgroundGame")
    
    var eggCount = 0
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scaleMode = .fill
        
        backgroundColor = sceneColor
        
        labelTeste = SKLabelNode(text: "\(self.view!.bounds.size.width)")
        labelTeste.position = CGPoint(x: 0, y: -100)
        //addChild(labelTeste)
        
        
        field = SKField(color: fieldColor, thickness: 10, height: size.height, width: size.width, topBoardOffSet: 175, leftBoardOffSet: 0, rightBoardOffSet: 0, bottomBoardOffSet: 0)
        addChild(field)
        
        backgroundGameNode = SKSpriteNode(texture: backgroundTexture, color: .clear, size: CGSize(width: size.width - 20, height:size.height - 195))
        backgroundGameNode.position = CGPoint(x: 0, y: -90)
        addChild(backgroundGameNode)
        
        self.addChild(backgroundSound)
        backgroundSound.autoplayLooped = true
        backgroundSound.run(SKAction.stop())
        
        character = SKCharacter()
        character.size = CGSize(width: 100, height: 100)
        character.zPosition = 1
        addChild(character)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let location = touch.location(in: self)
//            if location.x >= 0 && location.y >= 0 {
//                character.setMoveTexture(move: .up)
//            } else if location.x < 0 && location.y > 0 {
//                character.setMoveTexture(move: .down)
//            } else if location.x < 0 && location.y < 0 {
//                character.setMoveTexture(move: .left)
//            } else {
//                character.setMoveTexture(move: .right)
//            }
//        }
//    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let _ = (contact.bodyA.node as? SKCharacter) ?? (contact.bodyB.node as? SKCharacter) else {return}
        guard let nodeB = (contact.bodyA.node as? SKEgg) ?? (contact.bodyB.node as? SKEgg) else {return}
        
        nodeB.removeFromParent()
        eggCount -= 1
        if(eggCount <= 0) {
            PlaygroundPage.current.assessmentStatus = .pass(message: "Great job, you captured all the eggs!! Check out the [next page](@next)")
        }
        
        //self.pontos += 1
        //self.labelPontos.text = "\(pontos!)"
    }
    
    func spawnEgg() {
        let xOffSet = SKEgg.defaultSize.width/2
        let yOffSet = SKEgg.defaultSize.height/2
        let x: CGFloat = CGFloat.random(in: field.fieldWidthStart + xOffSet...field.fieldWidthEnd - xOffSet)
        let y: CGFloat = CGFloat.random(in: field.fieldHeightStart + yOffSet...field.fieldHeightEnd - yOffSet)
        let spawnPoint = CGPoint(x: x, y: y)
        addChild(SKEgg(pos: spawnPoint))
    }
    
    func addEggs() {
        if(eggCount > 0) {
            for _ in 1...eggCount {
                spawnEgg()
            }
        }
    }
    
    func setMoveTexture(move: Moves) {
        character.setMoveTexture(move: move)
    }
    
    func resetScene() {
        self.removeAllChildren()
        self.didMove(to: self.view!)
    }
}


protocol GameDelegate2 {
    func setMoveTexture(move: Moves)
}

