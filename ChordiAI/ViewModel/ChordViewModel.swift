//
//  ChordsManager.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import AVFoundation

final class ChordViewModel: ObservableObject {
    
    // MARK: - Variables
    
    /// Bool detecting when user started the playing session.
    @Published var startPlaying = false
    
    /// Chord variable used to interact with chord currently playing.
    @Published var currentChord: Chord?
    
    private var isPlaying = false
    
    // MARK: - Functions
    
    /**
     Function that determine which chord that should be played from the amount of
     fingertips detected by Vision. Only starts playback when the MIDI player is finished
     with its current playback.
     
     - parameter fingerAmount: The amount of fingertips detected by the Vision framework.
     */
    public func determinePlayback(with amountOfFingers: Int) {
        guard amountOfFingers != 0 else { return }
        
        if !MIDIPlayerManager.shared.isMIDIPlaying() {
            guard let selectedChord = ChordManager.selectChord(from: amountOfFingers) else { return }
            
            currentChord = selectedChord
            
            MIDIPlayerManager.shared.playMIDI(chord: selectedChord.rawValue)
        }
    }
}
