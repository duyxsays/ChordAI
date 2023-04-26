//
//  ChordsManager.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import Foundation
import AVFoundation

final class ChordsManager: ObservableObject {
    @Published var isPlaying: Bool = false
    
    private var goalCount = 0
    
    @Published var makeItRain = false
    @Published private(set) var successBadge: Int?
    @Published var didStart = false
    
    private var shouldEvaluateResult = true
    
    func start() {
        makeItRain = true
    }
    
    func didRainStars(count: Int) {
        goalCount = count
    }
    
    func countFingers(_ count: Int) {
        if !didStart {
            return
        }
        
        if PlayerManager.shared.isMIDIPlaying() {
            shouldEvaluateResult = false
            successBadge = count
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.successBadge = nil
                self.makeItRain = true
                self.shouldEvaluateResult = true
            }
        }
    }
}
