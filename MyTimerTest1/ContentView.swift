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
    //      timerValueは@AppStorageで設定読み込み
    //    @AppStorage("timer_value") var timervalue = 10
    @State var timervalue: Int = 10
    @State var showAlert = false
    @State var kaisu = 1
    @State var dripData: DripData
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack(spacing: 30.0){
                    ZStack {
                        ProgressBar(progress: timervalue - count, initial: (timervalue))
                            .frame(width: 200,height: 200)
                        VStack {
                            Text("omosanohyouji")
                            Text(String(format: "%.0f", Double(timervalue - count) / Double(timervalue) * 100))
                                .font(.largeTitle)
                            Text("残り\(timervalue - count)秒")
                                .font(.largeTitle)
                            Text("\(kaisu)回目")
                        }
                    }
                    HStack{
                        Button{
                            startTimer()
                        } label: {
                            Text("スタート")
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(width: 120,height: 120)
                                .background(in: Circle())
                                .backgroundStyle(Color("startColor"))
                        }
                        Button{
                            stopTimer()
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
            .onAppear{
                count = 0
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink{
                        SettingView(timerValue: $timervalue)
                    } label: {
                        Text("設定")
                    }
                }
            }
            .alert("修了",isPresented: $showAlert) {
                Button("Ok") {
                    //                    print("Okがタップされました")
                }
            }message: {
                Text("タイマー修了時間です。")
            }
        }
    }
    
    func countDownTimer() {
        count += 1
        if timervalue - count <= 0 {
            //            ここで回数を数える
            
            //            Timer停止
            showAlert = true
            timerHandler?.invalidate()
        }
    }
    
    func startTimer() {
        if let unwrappedTimerHandler = timerHandler {
            if unwrappedTimerHandler.isValid == true {
                return
                //                何もしない
            }
        }
        if timervalue - count <= 0 {
            count = 0
            //            showAlert = false
        }
        //        タイマースタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countDownTimer()
        }
    }
    
    func stopTimer() {
        if let unwrappedTimerHandler = timerHandler {
            if unwrappedTimerHandler.isValid == true {
                unwrappedTimerHandler.invalidate()
            }
        }
    }
    
}

#Preview {
    ContentView(dripData: DripData(mame: 12.0, kosa: 6.0, time: [5,10,12]))
}
