//
//  caclApp.swift
//  cacl
//
//  Created by Михаил  Галицкий on 08.01.2022.
//

import SwiftUI

@main
struct caclApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GlobalDisplayEnv())
        }
    }
}
