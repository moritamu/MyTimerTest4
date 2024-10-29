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
//        @Bindable var dripData = dripData
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("豆の重さを入力")
//                format: .numberで数値を入力できる
                TextField("豆の重さ", value: $dripData.mame, format: .number)
                    .frame(width: 100)
                    .multilineTextAlignment(TextAlignment.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("g")
                Spacer()
            }
            Text("豆の重さ: " + String(format: "%.1f", dripData.mame))
            Text("はじめのお湯の量: " + String(format: "%.1f", dripData.hotWT * 0.2))
            Text("２回目のお湯の量: " + String(format: "%.1f", dripData.hotWT * 0.4))
            Text("３回目のお湯の量: " + String(format: "%.1f", dripData.hotWT))
                .padding(.bottom)
            
            Text("コーヒーの濃さ")
            Picker(selection: $dripData.kosa, label: Text("濃さ")) {
                Text("薄い").tag(5.0)
                Text("普通").tag(6.0)
                Text("やや濃い").tag(7.0)
                Text("濃い").tag(8.0)
            }
//            .pickerStyle(.wheel)
            .pickerStyle(.segmented)
            .padding(.bottom)
            Text("コーヒーの濃さ: " + String(dripData.kosa))

            Spacer()
            

                 

        }
    }
}

#Preview {
    MameSetView(dripData: .init(mame: 12, kosa: 6, time: []))
}
