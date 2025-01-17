//
//  ContentView.swift
//  learn-ios-mvvm
//
//  Created by Rhony on 15/01/25.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var counterVM: CounterViewModel

    init() {
        counterVM = CounterViewModel()
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Text(counterVM.premium ? "Premium" : "Basic")
                .foregroundColor(Color.green)
                .frame(width: 200, height: 100)
                .font(.largeTitle)

            Text("\(counterVM.value)")
                .font(.title)

            Button("Increment") {
                counterVM.increment()
            }
        }
            .padding()
    }
}

#Preview {
    ContentView()
}
