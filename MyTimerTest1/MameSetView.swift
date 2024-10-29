//
//  MameSetView.swift
//  MyTimerTest1
//
//  Created by MsMacM on 2024/10/26.
//

import SwiftUI

struct MameSetView: View {
    @State var dripData: DripData
    
    var body: some View {
        @Bindable var dripData = dripData
        
        VStack {
            HStack {
                Spacer()
                Text("豆の重さを入力")
//                format: .numberで数値を入力できる
                TextField("豆の重さ", value: $dripData.mame, format: .number)
                    .frame(width: 100)
                    .multilineTextAlignment(TextAlignment.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
//                        いらなくなった
//                        dripData.mame = Double(mame1) ?? 12.0
                    }
                
                Text("g")
                Button {
                
                } label: {
                    Text("押す")
                }
                Spacer()

            }
            Text("豆の重さ: " + String(format: "%.1f", dripData.mame))
                
            Text("はじめのお湯の量: " + String(format: "%.1f", dripData.hotWT * 0.2))
//                .background(Color.blue)
            Text("２回目のお湯の量: " + String(format: "%.1f", dripData.hotWT * 0.4))
            Text("３回目のお湯の量: " + String(format: "%.1f", dripData.hotWT))
            
                 

        }
    }
}

#Preview {
    MameSetView(dripData: .init(mame: 12, kosa: 6, time: []))
}
