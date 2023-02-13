//
//  FavouritesView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject var favourites = UserFavourites()
    @State var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(favourites.items) { item in
                        Text("\(item.name), \(item.streetName), \(item.countryName)")
                            .fontWeight(.bold)
                    }
                    .onDelete(perform: removeItems)
                }
            }
        }
        .toolbar {
            Button {
                let favourite = UserFavourite(name: "Test", streetName: "Test Street", countryName: "South Africa", rating: 4.5)
                favourites.items.append(favourite)
            } label: {
                Image(systemName: "plus")
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        favourites.items.remove(atOffsets: offsets)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
