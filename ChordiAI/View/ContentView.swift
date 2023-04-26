//
//  ContentView.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var overlayPoints: [CGPoint] = []
    @State private var didStart: Bool = false
    @StateObject private var chordsManager = ChordsManager()
    
    var body: some View {
        ZStack {
            
            CameraView {
                overlayPoints = $0
                if didStart {
                    chordsManager.countFingers($0.count)
                }
            }.overlay(FingersOverlay(with: overlayPoints)
                .foregroundColor(.green)
            ).edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Spacer()
                
                Spacer()
                
                Spacer()
                
                Button {
                    
                    didStart.toggle()
                    
                    didStart ? PlayerManager.shared.playMidi{ didStart.toggle() } : PlayerManager.shared.stopMIDIPlayer()
                } label: {
                    Text(didStart ? "End" : "Start")
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
