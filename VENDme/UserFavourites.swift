//
//  UserFavourites.swift
//  VENDme
//
//  Created by Mark Strijdom on 13/02/2023.
//

import Foundation

class UserFavourites: ObservableObject {
    let favourites: [UserFavourite]
    
    var primary: UserFavourite {
        favourites[0]
    }
    
    init() {
        let url = Bundle.main.url(forResource: "VMInformation", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        favourites = try! JSONDecoder().decode([UserFavourite].self, from: data)
    }
}
