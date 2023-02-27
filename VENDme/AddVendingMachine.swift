//
//  AddVendingMachine.swift
//  VENDme
//
//  Created by Mark Strijdom on 27/02/2023.
//

import Foundation

struct Item: Codable {
    var name: String

    enum CodingKeys: String, CodingKey {
        case name
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
