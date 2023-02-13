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
    @State var searchText = ""
    
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
                    MapView(vendingMachines: vendingMachines)
                }
                .searchable(text: $searchText)
                .tabItem {
                    Image(systemName: "location.magnifyingglass")
                    Text("Locations")
                }
                
                NavigationView {
                    FavouritesView()
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("Favourites")
                }
                .toolbar {
                    EditButton()
                }
            }
            .environmentObject(vendingMachines)
        }
    }
}
