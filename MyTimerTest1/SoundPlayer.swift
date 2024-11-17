//
//  SoundPlayer.swift
//  MyTimerTest1
//
//  Created by MsMacM on 2024/11/17.
//

import UIKit
import AVFoundation


class SoundPlayer: NSObject {
    let musicData = NSDataAsset(name: "kettei")!.data
    
    var player: AVAudioPlayer!
    
    func play() {
        do {
            player = try! AVAudioPlayer(data: musicData)
            player.play()
        } catch {
            print("音楽がなりません")
        }
    }

}
