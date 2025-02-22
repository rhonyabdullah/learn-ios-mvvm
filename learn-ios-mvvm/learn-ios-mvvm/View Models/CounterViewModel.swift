//
//  CounterViewModel.swift
//  learn-ios-mvvm
//
//  Created by Rhony on 15/01/25.
//

import Foundation
import SwiftUI

class CounterViewModel: ObservableObject {

    @Published private var counter = Counter()

    var value: Int {
        counter.value
    }

    var premium: Bool {
        counter.isPremium
    }

    func increment() {
        counter.increment()
    }
}
