//
//  ChordManager.swift
//  ChordiAI
//
//  Created by Simon Andersen on 30/04/2023.
//

struct ChordManager {
    /**
     Returns the name of MIDI chord issued to be played
     
     - parameter amountOfFingers: The amount of fingers recognized by the Vision framework
     */
    static func selectChord(from amountOfFingers: Int) -> Chord? {
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
