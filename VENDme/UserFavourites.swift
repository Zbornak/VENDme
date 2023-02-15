//
//  UserFavourites.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import Foundation

//class containing favourites set
class UserFavourites: ObservableObject {
    @Published var favourites = Set<Int>()
}
