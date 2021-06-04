//
//  SKField.swift
//  BookCore
//
//  Created by Matheus Kulick on 16/04/21.
//

import Foundation
import SpriteKit

class SKField: SKShapeNode {
    
    var fieldWidthStart: CGFloat
    var fieldWidthEnd: CGFloat
    var fieldHeightStart: CGFloat
    var fieldHeightEnd: CGFloat
    
    init(color: UIColor, thickness: CGFloat, height: CGFloat, width: CGFloat, topBoardOffSet: CGFloat, leftBoardOffSet: CGFloat, rightBoardOffSet: CGFloat, bottomBoardOffSet: CGFloat) {
        
        self.fieldWidthStart = -width/2 + thickness + leftBoardOffSet
        self.fieldWidthEnd = width/2 - thickness - rightBoardOffSet
        self.fieldHeightStart = -height/2 + thickness + bottomBoardOffSet
        self.fieldHeightEnd = height/2 - thickness - topBoardOffSet
        
        super.init()
        self.isUserInteractionEnabled = false

        let myPath = CGMutablePath()
        let height = height
        let width = width
        let bottomBoard = [
            CGPoint(x: -width/2 + leftBoardOffSet, y: -height/2 + bottomBoardOffSet),
            CGPoint(x: -width/2 + leftBoardOffSet, y: -height/2 + thickness + bottomBoardOffSet),
            CGPoint(x: width/2 - rightBoardOffSet, y: -height/2 + thickness + bottomBoardOffSet),
            CGPoint(x: width/2 - rightBoardOffSet, y: -height/2 + bottomBoardOffSet)
        ]
        
        let topBoard = [
            CGPoint(x: -width/2 + leftBoardOffSet, y:height/2 - topBoardOffSet),
            CGPoint(x: -width/2 + leftBoardOffSet, y:height/2 - thickness - topBoardOffSet),
            CGPoint(x: width/2 - rightBoardOffSet, y:height/2 - thickness - topBoardOffSet),
            CGPoint(x: width/2 - rightBoardOffSet, y:height/2 - topBoardOffSet)
        ]
        
        let rightBoard = [
            CGPoint(x: width/2 - rightBoardOffSet, y: -height/2 + thickness + bottomBoardOffSet),
            CGPoint(x: width/2 - thickness - rightBoardOffSet, y: -height/2 + thickness + bottomBoardOffSet),
            CGPoint(x: width/2 - thickness - rightBoardOffSet, y: height/2 - thickness - topBoardOffSet),
            CGPoint(x: width/2 - rightBoardOffSet, y:height/2 - thickness - topBoardOffSet)
        ]
        
        let leftBoard = [
            CGPoint(x: -width/2 + leftBoardOffSet, y: -height/2 + thickness + bottomBoardOffSet),
            CGPoint(x: -width/2 + thickness + leftBoardOffSet, y: -height/2 + thickness + bottomBoardOffSet),
            CGPoint(x: -width/2 + thickness + leftBoardOffSet, y:height/2 - thickness - topBoardOffSet),
            CGPoint(x: -width/2 + leftBoardOffSet, y:height/2 - thickness - topBoardOffSet)
        ]
        
        myPath.addLines(between: bottomBoard)
        myPath.closeSubpath()
        myPath.addLines(between: topBoard)
        myPath.closeSubpath()
        myPath.addLines(between: rightBoard)
        myPath.closeSubpath()
        myPath.addLines(between: leftBoard)
        myPath.closeSubpath()
        self.path = myPath
        self.fillColor = color
        self.strokeColor = color
        self.physicsBody = SKPhysicsBody(bodies: [physicsBodyFrom(bottomBoard), physicsBodyFrom(topBoard), physicsBodyFrom(rightBoard), physicsBodyFrom(leftBoard)])
        
        self.physicsBody?.categoryBitMask = Category.field
        self.physicsBody?.collisionBitMask = Category.all
//        self.physicsBody?.contactTestBitMask = Category.allBut(Category.field)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.pinned = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.density = CGFloat.greatestFiniteMagnitude
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.isDynamic = false
        self.isHidden = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func physicsBodyFrom(_ coordenates:[CGPoint])->SKPhysicsBody {
        let physicsBodyPath = CGMutablePath()
        physicsBodyPath.addLines(between: coordenates)
        let physicsBody = SKPhysicsBody(polygonFrom: physicsBodyPath)
        self.physicsBody?.categoryBitMask = Category.field
        self.physicsBody?.collisionBitMask = Category.all
//        self.physicsBody?.contactTestBitMask = Category.allBut(Category.field)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.pinned = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.density = CGFloat.greatestFiniteMagnitude
        self.physicsBody?.usesPreciseCollisionDetection = true
        //        self.physicsBody?.isDynamic = false
        return physicsBody
    }
}

