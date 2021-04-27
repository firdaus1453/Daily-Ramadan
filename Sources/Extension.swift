import UIKit
import AVFoundation

var soundURI: URL?
var audioPlayer = AVAudioPlayer()
var bgSoundURI: URL?
var bgAudioPlayer = AVAudioPlayer()
var bgGameAudioPlayer = AVAudioPlayer()

extension UIView {
    
    func playSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func CorrectSound() {
        self.playSound(file: "CorrectSound", fileExtension: "wav")
    }
    
    func AwSound() {
        self.playSound(file: "AwSound", fileExtension: "wav")
    }
    
    func WinSound() {
        self.playSound(file: "WinSound", fileExtension: "wav")
    }
    
    func playBgSound(){
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: "MainBG", ofType: "wav")!)
        do {
            guard let uri = bgSoundURI else {return}
            bgAudioPlayer = try AVAudioPlayer(contentsOf: uri)
            bgAudioPlayer.numberOfLoops = -1
            bgAudioPlayer.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func playGameBgSound(){
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: "GameBG", ofType: "wav")!)
        do {
            guard let uri = bgSoundURI else {return}
            bgGameAudioPlayer = try AVAudioPlayer(contentsOf: uri)
            bgGameAudioPlayer.numberOfLoops = -1
            bgGameAudioPlayer.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func stopBgSound() {
        bgAudioPlayer.stop()
    }
    
    func stopGameBgSound() {
        bgGameAudioPlayer.stop()
    }
}
