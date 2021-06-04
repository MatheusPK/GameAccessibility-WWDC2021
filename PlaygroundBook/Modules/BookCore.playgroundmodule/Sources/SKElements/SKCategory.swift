//
//  SKCategory.swift
//  BookCore
//
//  Created by Matheus Kulick on 16/04/21.
//

import Foundation

class Category {
    static var character: UInt32 = 0x1 << 0
    static var field: UInt32 = 0x1 << 1
    static var egg: UInt32 = 0x1 << 2
    static var all: UInt32 = UInt32.max
    static func allBut(_ categories:UInt32...) -> UInt32 {
        return categories.reduce(Self.all, {a, b in a - b})
    }
}
