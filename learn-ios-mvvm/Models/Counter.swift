//
//  Counter.swift
//  learn-ios-mvvm
//
//  Created by Rhony on 15/01/25.
//

import Foundation

struct Counter {
    var value: Int = 0
    var isPremium: Bool = false

    mutating func increment() {
        value += 1
        isPremium = value % 3 == 0
    }
}
