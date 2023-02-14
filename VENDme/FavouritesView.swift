//
//  FavouritesView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject var vendingMachines: VendingMachines

    @StateObject var userFavourites: UserFavourites
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(vendingMachines.machines.filter({ userFavourites.favourites.contains($0.id) })) { vendingMachine in
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
                    .onDelete(perform: removeItems)
                }
            }
            .toolbar {
                EditButton()
            }
        }
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
