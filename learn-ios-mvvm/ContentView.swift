//
//  ContentView.swift
//  learn-ios-mvvm
//
//  Created by Rhony on 15/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var increment = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
        
            Text("Premium")
                .frame(width: 200, height: 100)
                .font(.largeTitle)
            
            Text("\(increment)")
                .font(.title)
            
            Button("Increment") {
                increment += 1
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
