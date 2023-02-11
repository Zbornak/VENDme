//
//  VENDmeApp.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

@main
struct VENDmeApp: App {
    @StateObject var vendingMachines = VendingMachines()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView(vendingMachine: vendingMachines.primary)
                }
                .tabItem {
                    Image(systemName: "lightswitch.off")
                    Text("Discover")
                }
                
                NavigationView {
                    //MapView()
                    MapView(vendingMachines: vendingMachines)
                }
                .tabItem {
                    Image(systemName: "location.magnifyingglass")
                    Text("Locations")
                }
            }
            .environmentObject(vendingMachines)
        }
    }
}
