//
//  ArrochaApp.swift
//  Arrocha
//
//  Created by ifpb on 26/06/23.
//

import SwiftUI

@main
struct ArrochaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(arrocha: ArrochaViewModel())
        }
    }
}
