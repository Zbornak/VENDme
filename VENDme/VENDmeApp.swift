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
    
    @StateObject var locationManager = LocationManager()
    
    @StateObject var userFavourites = UserFavourites()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    MapView(vendingMachines: vendingMachines, userFavourites: userFavourites, locationManager: locationManager)
                }
                .tabItem {
                    Image(systemName: "location.magnifyingglass")
                    Text("Discover")
                }
                
                NavigationView {
                    FavouritesView(vendingMachines: vendingMachines, userFavourites: userFavourites)
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("Favourites")
                }
                
                NavigationView {
                    AddView(numberOfRatings: .constant(0), userHasLeftRating: .constant(true))
                }
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add Machine")
                }
                
                NavigationView {
                    FeaturedView(vendingMachines: vendingMachines, userFavourites: userFavourites)
                }
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Featured")
                }
            }
        }
    }
}
