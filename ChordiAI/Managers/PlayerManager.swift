//
//  PlayerManager.swift
//  ChordiAI
//
//  Created by Simon Andersen on 24/04/2023.
//

import Foundation
import AVFoundation

/// Class used for managing MIDI player
class PlayerManager {
    
    /// Singleton instance
    static let shared = PlayerManager()
    
    /// MIDI Player for MIDI playback
    private var midiPlayer: AVMIDIPlayer?
    
    /// Method for starting playback of MIDI
    func playMidi(finished: @escaping () -> Void) {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "ebMaj", withExtension: "mid") else { return }
            
            guard let soundBankURL  = Bundle.main.url(forResource: "Piano", withExtension: "sf2") else { return }
            
            midiPlayer = try AVMIDIPlayer(contentsOf: fileUrl, soundBankURL: soundBankURL)
            midiPlayer?.prepareToPlay()
            midiPlayer?.play {
                print("stopped")
                finished()
            }
        } catch {
            print("Failed to load MIDI file or soundbank: \(error.localizedDescription)")
        }
    }
    
    /// Function used to stop MIDI playback
    func stopMIDIPlayer() {
        guard isMIDIPlaying() else { return }
        
        midiPlayer?.stop()
        midiPlayer = nil
    }
    
    /// Function used for checking is MIDI player is currently playing
    func isMIDIPlaying() -> Bool {
        guard let midiPlayer = midiPlayer else { return false }
        
        return midiPlayer.isPlaying ? true : false
    }
}
