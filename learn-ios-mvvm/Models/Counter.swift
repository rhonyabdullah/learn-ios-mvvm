//
//  Counter.swift
//  learn-ios-mvvm
//
//  Created by Rhony on 15/01/25.
//

import Foundation

struct Counter {
    var value: Int = 0

    mutating func increment() {
        value += 1
    }
}
