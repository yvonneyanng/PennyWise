//
//  PennyWiseApp.swift
//  PennyWise
//
//  Created by Yvonne Yang on 2024/11/1.
//

import SwiftUI
import SwiftData

@main
struct PennyWiseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}

#Preview {
    ContentView()
}
