//
//  FavouritesView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

struct FavouritesView: View {
    @ObservedObject var vendingMachines: VendingMachines
    
    @ObservedObject var userFavourites: UserFavourites
    
    var body: some View {
        VStack {
            List {
                ForEach(vendingMachines.machines.filter({ userFavourites.favourites.contains($0.id) })) { vendingMachine in
                    NavigationLink {
                        ContentView(vendingMachine: vendingMachine, userFavourites: userFavourites)
                    } label: {
                        VStack {
                            HStack {
                                Image(systemName: "lightswitch.off")
                                Text(vendingMachine.name)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            HStack {
                                Text(vendingMachine.street)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                            HStack {
                                Text(vendingMachine.country)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("Favourites")
    }
    
    func removeItems(at offsets: IndexSet) {
        vendingMachines.machines.remove(atOffsets: offsets)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(vendingMachines: VendingMachines(), userFavourites: UserFavourites())
    }
}
