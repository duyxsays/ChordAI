//
//  ChordiAIApp.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import SwiftUI

/// Vision hand pose recognition developed through the help of: https://www.kodeco.com/19454476-vision-tutorial-for-ios-detect-body-and-hand-pose
///
@main
struct Main: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
