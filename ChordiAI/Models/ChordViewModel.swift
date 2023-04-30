//
//  ChordsManager.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import Foundation
import AVFoundation

final class ChordViewModel: ObservableObject {
    /// Bool detecting when user started the playing session
    @Published var startPlaying = false
    
    @Published var currentChord: Chord?
    
    /// Bool for when the fingers are detected and started playing a chord
    var isPlaying: Bool = false
    
    /**
     Function that determine which chord that should be played from the amount of
     fingertips detected by Vision.
     
     - parameter fingerAmount: The amount of fingertips detected by the Vision framework.
     */
    public func determinePlayback(with amountOfFingers: Int) {
        guard amountOfFingers != 0 else { return }
        
        if !MIDIPlayerManager.shared.isMIDIPlaying() {
            guard let selectedChord = selectChord(from: amountOfFingers) else { return }
            
            currentChord = selectedChord
            
            playChord(chord: selectedChord.rawValue)
            
            isPlaying.toggle()
        }
    }
    
    /**
     Issues the playback of a chord through the MIDIPlayerManager.
     
     - parameter chord: String of the associated MIDI file name.
     */
    private func playChord(chord: String) {
        MIDIPlayerManager.shared.playMIDI(chord: chord) {
            self.isPlaying.toggle()
        }
    }
    
    /**
     Returns the name of MIDI chord issued to be played
     
     - parameter amountOfFingers: The amount of fingers recognized by the Vision framework
     */
    private func selectChord(from amountOfFingers: Int) -> Chord? {
        switch amountOfFingers {
            case 1:
                return .cMin3
            case 2:
                return .ebMaj3
            case 3:
                return .fMin3
            case 4:
                return .gMin3
            case 5:
                return .abMaj3
            case 6:
                return .bbMaj3
            case 7:
                return .cMin4
            case 8:
                return .abMaj2
            case 9:
                return .gMin2
            case 10:
                return .fMin2
            default:
                return nil
        }
    }
}
