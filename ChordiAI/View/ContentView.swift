//
//  ContentView.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var overlayPoints: [CGPoint] = []
    @StateObject private var chordVM = ChordViewModel()
    
    var body: some View {
        ZStack {
            
            CameraView {
                overlayPoints = $0
                if chordVM.startPlaying {
                    chordVM.determinePlayback(with: $0.count)
                }
            }.overlay(FingersOverlay(with: overlayPoints)
                .foregroundColor(.green))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Spacer()
                if chordVM.startPlaying {
                    Text("Current chord: " + (chordVM.currentChord?.rawValue ?? "N/A"))
                } else {
                    Text("Press start to begin playing")
                }
                
                Spacer()
                
                Spacer()
                
                Button {
                    
                    chordVM.startPlaying.toggle()
                    
                } label: {
                    Text(chordVM.startPlaying ? "End" : "Start")
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.4))
                        .clipShape(Capsule())
                }
                
                Spacer()
            }
        }
    }
}
