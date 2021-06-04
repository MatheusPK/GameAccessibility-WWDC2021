//
//  SKCharacter.swift
//  BookCore
//
//  Created by Matheus Kulick on 09/04/21.
//

import Foundation
import SpriteKit

enum Moves {
    case up
    case down
    case right
    case left
    case idle
    case eat
}

enum faceExpression: Int {
    case smile
    case tongueOut
    case mouthPucker
    case eyeBlinkLeft
    case eyeBlinkRight
    case idle
}

enum FrontExpression: Int {
    case frontTongueOut
    case frontMouthPucker
    case frontEyeBlinkLeft
    case frontEyeBlinkRight
    case frontIdle
}

class SKCharacter: SKSpriteNode {
    
    static let defaultSize = CGSize(width: 50, height: 50)
    
    private let characterExpressions:[Moves:SKTexture] = [
        .up : SKTexture(imageNamed: "FrontPose_Up"),
        .down : SKTexture(imageNamed: "FrontPose_Down"),
        .right : SKTexture(imageNamed: "RightPose_Right"),
        .left: SKTexture(imageNamed: "LeftPose_Left"),
        .idle: SKTexture(imageNamed: "IdlePose_Front")
    ]
    
    private let frontExpressionsTextures:[FrontExpression:SKTexture] = [
        .frontTongueOut : SKTexture(imageNamed: "FrontPose_Down"),
        .frontMouthPucker : SKTexture(imageNamed: "FrontPose_Up"),
        .frontEyeBlinkLeft: SKTexture(imageNamed: "FrontPose_Left"),
        .frontEyeBlinkRight: SKTexture(imageNamed: "FrontPose_Right"),
        .frontIdle: SKTexture(imageNamed: "IdlePose_Front")
    ]
    
    private let characterMoves:[Moves: SKAction] = [
        .up : SKAction.moveBy(x: 0, y: 5, duration: 0.1),
        .down : SKAction.moveBy(x: 0, y: -5, duration: 0.1),
        .left : SKAction.moveBy(x: -5, y: 0, duration: 0.1),
        .right : SKAction.moveBy(x: 5, y: 0, duration: 0.1),
    ]
    
    init() {
        super.init(texture: frontExpressionsTextures[.frontIdle], color: .magenta, size: SKCharacter.defaultSize)
        size = (texture?.size())!
        position = CGPoint(x: 0, y: -100)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        self.physicsBody?.categoryBitMask = Category.character
        self.physicsBody?.collisionBitMask = Category.allBut(Category.character, Category.egg)
        self.physicsBody?.contactTestBitMask = Category.egg
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        
    }
    
    func setMoveTexture(move: Moves) {
        texture = characterExpressions[move]
        if(move != .idle) {
            run(characterMoves[move]!)
        }
    }
    func setFrontTexture(expression: FrontExpression) {
        texture = frontExpressionsTextures[expression]
    }
    
    func animate() {
        let grow = SKAction.scale(to: 1, duration: 3)
        
        let setIdleTexture = SKAction.repeatForever(SKAction.animate(with: [SKTexture(imageNamed: "IdlePose_Front"), SKTexture(imageNamed: "FrontPose_Up")], timePerFrame: 1))
        
        run(SKAction.sequence([grow, setIdleTexture]))
        
    }
    
    func animate2() {
        let grow = SKAction.scale(to: 1, duration: 3)
        
        let setIdleTexture = SKAction.repeatForever(SKAction.animate(with: [SKTexture(imageNamed: "FrontPose_Right"), SKTexture(imageNamed: "FrontPose_Down")], timePerFrame: 1))
        
        run(SKAction.sequence([grow, setIdleTexture]))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


