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
            TabView {
                NavigationView {
                    ContentView(vendingMachine: VendingMachines().primary)
                }
                .tabItem {
                    Image(systemName: "lightswitch.off")
                    Text("Discover")
                }
                
                NavigationView {
                    MapView()
                }
                .tabItem {
                    Image(systemName: "location.magnifyingglass")
                    Text("Locations")
                }
            }
        }
    }
}
