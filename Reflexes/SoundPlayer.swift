//
//  SoundPlayer.swift
//  Reflexes
//
//  Created by 間口秀人 on 2022/09/06.
//

import Foundation
import UIKit
import AVFoundation

class SoundPlayer: NSObject {

    let OpenMusic_data=NSDataAsset(name: "OpenBGM")!.data
    let music_data=NSDataAsset(name: "Correct")!.data   // 音源の指定
    let music_data1=NSDataAsset(name: "InCorrect")!.data
    let music_data2=NSDataAsset(name: "Pahu")!.data
    var music_player:AVAudioPlayer!

    // 音楽を再生
    func OpenMusicPlayer(){
        do{
            music_player=try AVAudioPlayer(data:OpenMusic_data)   // 音楽を指定
            music_player.play() // 音楽再生
        }catch{
            print("エラー発生.音を流せません")
        }
    }
    
    func musicPlayer(){
        do{
            music_player=try AVAudioPlayer(data:music_data)   // 音楽を指定
            music_player.play()   // 音楽再生
        }catch{
            print("エラー発生.音を流せません")
        }
    }
    
    func musicPlayer1(){
        do{
            music_player=try AVAudioPlayer(data:music_data1)   // 音楽を指定
            music_player.play()   // 音楽再生
        }catch{
            print("エラー発生.音を流せません")
        }
    }
    
    func musicPlayer2(){
        do{
            music_player=try AVAudioPlayer(data:music_data2)   // 音楽を指定
            music_player.play()   // 音楽再生
        }catch{
            print("エラー発生.音を流せません")
        }
    }
    
}
