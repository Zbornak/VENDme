//
//  FeaturedView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import SwiftUI

struct FeaturedView: View {
    @ObservedObject var vendingMachines: VendingMachines
    
    @ObservedObject var userFavourites: UserFavourites
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("This week's most visited Vending Machines")
                    .fontWeight(.bold)
                List {
                    ForEach(vendingMachines.machines) { vendingMachine in
                        NavigationLink {
                            ContentView(vendingMachine: vendingMachine, userFavourites: userFavourites)
                        } label: {
                            HStack {
                                Image(vendingMachine.mainPicture)
                                    .resizable()
                                    .cornerRadius(10)
                                    .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                                    .shadow(radius: 5)
                                
                                VStack {
                                    HStack {
                                        Text(vendingMachine.name)
                                            .fontWeight(.bold)
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("\(vendingMachine.city), \(vendingMachine.country)")
                                            .foregroundColor(.secondary)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
        }
        .toolbar {
            EditButton()
        }
        .navigationTitle("Featured")
    }
    
    func removeItems(at offsets: IndexSet) {
        let vendingMachines = vendingMachines.machines.filter({ userFavourites.favourites.contains($0.id) })
        for index in offsets {
            let vendingMachine = vendingMachines[index]
            userFavourites.favourites.remove(vendingMachine.id)
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(vendingMachines: VendingMachines(), userFavourites: UserFavourites())
    }
}
