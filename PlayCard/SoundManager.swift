//
//  SoundManager.swift
//  PlayCard
//
//  Created by yuehong zhang on 2019-08-14.
//  Copyright © 2019 yuehong zhang. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager{
    static var audioPlayer:AVAudioPlayer?
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    static func playSound(_ effect:SoundEffect){
        var fileName:String = ""
        switch effect{
        case .flip: fileName = "cardflip"
        case .shuffle: fileName = "shuffle"
        case .match: fileName = "dingcorrect"
        case .nomatch: fileName = "dingwrong"
        }
        let urlPath = Bundle.main.path(forResource: fileName, ofType: "wav")
        let url = URL(fileURLWithPath: urlPath!)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }catch{
            print("can not find the sound file")
        }
    }
}
