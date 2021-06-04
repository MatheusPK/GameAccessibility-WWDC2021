//
//  SKEgg.swift
//  BookCore
//
//  Created by Matheus Kulick on 16/04/21.
//

import Foundation
import SpriteKit


class SKEgg: SKSpriteNode {
    
    static let defaultSize = CGSize(width: 60, height: 50)
    var defaultTexture = SKTexture(imageNamed: "egg")
    
    init(pos: CGPoint) {
        super.init(texture: nil, color: .black, size: SKEgg.defaultSize)
        position = pos
        texture = defaultTexture
        physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody?.categoryBitMask = Category.egg
        physicsBody?.contactTestBitMask = Category.allBut(Category.field, Category.egg)
        physicsBody?.isDynamic = false
        zPosition = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
