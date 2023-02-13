//
//  UserFavourite.swift
//  VENDme
//
//  Created by Mark Strijdom on 13/02/2023.
//

import Foundation

struct UserFavourite: Codable, Identifiable {
    var id = UUID()
    let name: String
    let streetName: String
    let countryName: String
    let rating: Double
    
    static let example = UserFavourite(name: "Seventeen-Ice", streetName: "3, Odorihigashi 1-Chōme", countryName: "Japan", rating: 4.5)
}
