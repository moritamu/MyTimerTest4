//
//  DripData.swift
//  MyTimerTest1
//
//  Created by MsMacM on 2024/09/06.
//

import Foundation
import Observation

@Observable class DripData {
    var mame: Double = 12
    var kosa: Double = 6
//    時間を配列で、例[45,45,45] [１回目,２回目,３回目,・・・]
//    var time: Array<Any>
    var time: [Int] = [10,20,30]
    
    var hotWT: Double {
        get {
            return mame / kosa * 100.0
        }
    }
    
    //    var hotWF: Double {
    //        get {
    //            return mame / kosa * 20
    //        }
    //    }
    //
    //    var hotWS: Double {
    //        get {
    //            return mame / kosa * 40
    //        }
    //    }
    //    計算はその都度でいい
    init(mame: Double, kosa: Double, time: [Int]) {
        self.mame = mame
        self.kosa = kosa
        self.time = time
    }
    
}
