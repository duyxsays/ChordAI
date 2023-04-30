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
                .foregroundColor(Theme.Colour.colorSecondary))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                if chordVM.startPlaying {
                    Text("Current chord:" + (chordVM.currentChord?.rawValue ?? "N/A"))
                        .foregroundColor(Theme.Colour.colorText)
                        .font(.custom(
                                "Menlo",
                                fixedSize: 20))
                } else {
                    Text("Press start to begin playing")
                        .foregroundColor(Theme.Colour.colorText)
                        .font(.custom("Menlo", fixedSize: 20))
                }
                
                Spacer()
                
                Spacer()
                
                Button {
                    
                    chordVM.startPlaying.toggle()
                    
                } label: {
                    Text(chordVM.startPlaying ? "End" : "Start")
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(Theme.Colour.colorText)
                        .padding()
                        .font(.custom("Menlo", fixedSize: 16))
                        .padding(.horizontal)
                        .background(Theme.Colour.colorMain.opacity(0.6))
                        .clipShape(Capsule())
                }
                
                Spacer()
            }
        }
    }
}
