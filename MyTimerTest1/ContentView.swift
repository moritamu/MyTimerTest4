//
//  ContentView.swift
//  MyTimerTest1
//
//  Created by MsMacM on 2024/08/15.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?
    @State var count = 0
    @AppStorage("timer_value") var timervalue = 10
    
    var body: some View {

        NavigationStack {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack(spacing: 30.0){
                    Text("残り１０秒")
                        .font(.largeTitle)
                    HStack{
                        Button{
                            
                        } label: {
                            Text("スタート")
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(width: 120,height: 120)
                                .background(in: Circle())
                                .backgroundStyle(Color("startColor"))
                        }
                        Button{
                            
                        } label: {
                            Text("ストップ")
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(width: 120,height: 120)
                                .background(in: Circle())
                                .backgroundStyle(Color("stopColor"))
                        }

                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink{
                        SettingView()
                    } label: {
                        Text("設定")
                    }
                }
            }
        }
    }
    
    func countDowsTimer() {
        count += 1
        if timervalue - count <= 0 {
            timerHandler?.invalidate()
        }
    }

}

#Preview {
    ContentView()
}
