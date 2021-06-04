//
//  extensions.swift
//  BookCore
//
//  Created by Matheus Kulick on 10/04/21.
//

import Foundation
import SpriteKit

extension CGPoint {
    public static func -(lhs: CGPoint, zhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - zhs.x, y: lhs.y - zhs.y)
    }
    
    public static func +(lhs: CGPoint, zhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + zhs.x, y: lhs.y + zhs.y)
    }
}
