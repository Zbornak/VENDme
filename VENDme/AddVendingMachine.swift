//
//  AddVendingMachine.swift
//  VENDme
//
//  Created by Mark Strijdom on 27/02/2023.
//

import Foundation

struct Item: Codable {
    var id: Int
    var name: String
    var checkIns: Int
    var street: String
    var city: String
    var region: String
    var country: String
    var countryLatitude: Double
    var countryLongitude: Double
    var postcode: String
    var showMachine: Bool
    var type: Bool
    var inUse: Bool
    var description: String
    var latitude: Double
    var longitude: Double
    var userRating: Int
    var numberOfRatings: Int
    var mainPicture: String
    var picture2: String
    var picture3: String
    var picture4: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case checkIns
        case street
        case city
        case region
        case country
        case countryLatitude
        case countryLongitude
        case postcode
        case showMachine
        case type
        case inUse
        case description
        case latitude
        case longitude
        case userRating
        case numberOfRatings
        case mainPicture
        case picture2
        case picture3
        case picture4
    }
}

var array: [Item] = {
    do {
        let fileURL = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("VMInformation.json")

        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let items = try decoder.decode([Item].self, from: data)
        return items
    } catch {
        print(error.localizedDescription)
        return []
    }
}()
