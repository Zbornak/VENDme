//
//  UserFavourites.swift
//  VENDme
//
//  Created by Mark Strijdom on 13/02/2023.
//

import Foundation

class UserFavourites: ObservableObject {
    @Published var items = [UserFavourite]()
}
