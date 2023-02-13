//
//  FavouritesView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject var vendingMachines: VendingMachines
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(vendingMachines.machines) { vendingMachine in
                        Text("\(vendingMachine.name), \(vendingMachine.street), \(vendingMachine.country)")
                            .fontWeight(.bold)
                    }
                    .onDelete(perform: removeItems)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        vendingMachines.machines.remove(atOffsets: offsets)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(vendingMachines: VendingMachines())
    }
}
