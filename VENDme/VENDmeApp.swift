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
    @StateObject var userFavourites = UserFavourites()
    @State private var searchText = ""
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView(vendingMachine: vendingMachines.primary, userFavourites: userFavourites)
                }
                .tabItem {
                    Image(systemName: "lightswitch.off")
                    Text("Discover")
                }
                
                NavigationView {
                    MapView(vendingMachines: vendingMachines, userFavourites: userFavourites)
                }
                .searchable(text: $searchText)
                .tabItem {
                    Image(systemName: "location.magnifyingglass")
                    Text("Locations")
                }
                
                NavigationView {
                    FavouritesView(vendingMachines: VendingMachines(), userFavourites: userFavourites)
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("Favourites")
                }
                
                NavigationView {
                    AddView()
                }
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add Machine")
                }
            }
            .environmentObject(vendingMachines)
        }
    }
}
