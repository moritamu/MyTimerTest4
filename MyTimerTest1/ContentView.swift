//
//  ContentView.swift
//  MyTimerTest1
//
//  Created by MsMacM on 2024/08/15.
//

import SwiftUI

struct ContentView: View {
    @State private var timerRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            Text("\(timerRemaining)").font(.largeTitle)
            Button("スタート"){
                timerRemaining = 10
            }
            .font(.title)
            .foregroundColor(.red)
            .onReceive(timer) { _ in
                if timerRemaining > 0{
                    timerRemaining -= 1
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
