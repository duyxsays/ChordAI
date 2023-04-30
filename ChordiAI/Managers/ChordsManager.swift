//
//  ChordsManager.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import Foundation
import AVFoundation

final class ChordsManager: ObservableObject {
    var isPlaying: Bool = false
    
    @Published var startPlaying = false
    
    private var shouldEvaluateResult = true
    
    func countFingers(_ count: Int) {
        guard count != 0 else { return }
        
        if !PlayerManager.shared.isMIDIPlaying() {
            switch count {
                case 1:
                    playChord(chord: Chords.cMin.rawValue)
                case 2:
                    playChord(chord: Chords.ebMaj.rawValue)
                case 3:
                    playChord(chord: Chords.fMin.rawValue)
                case 4:
                    playChord(chord: Chords.gMin.rawValue)
                case 5:
                    playChord(chord: Chords.abMaj.rawValue)
                default:
                    return
            }
            
            isPlaying.toggle()
        }
    }
    
    private func playChord(chord: String) {
        PlayerManager.shared.playMidi(chord: chord) {
            self.isPlaying.toggle()
        }
    }
}
