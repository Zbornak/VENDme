//
//  VENDmeApp.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

@main
struct VENDmeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(vendingMachine: VendingMachines().primary)
            }
        }
    }
}
