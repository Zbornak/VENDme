//
//  VendingMachine.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import Foundation

struct VendingMachine: Identifiable, Codable {
    let id: Int
    let name: String
    let street: String
    let city: String
    let region: String
    let country: String
    let postcode: String
    let showMachine: Bool
    let type: String
    let inUse: Bool
    let description: String
    let latitude: Double
    let longitude: Double
    let userRating: Double
    let mainPicture: String
    let picture2: String
    let picture3: String
    let picture4: String
    
    static let example = VendingMachine(id: 1, name: "Seventeen Ice", street: "3, Odorihigashi 1-Chōme", city: "Sapporo", region: "Hokkaido", country: "Japan", postcode: "060-0041", showMachine: true, type: "Food", inUse: true, description: "Selling various flavours of 'Seventeen Ice' ice-cream, including Crispy Strawberry, Choco Mille-Feuille, Custard Purin and Muscat. The brand has been around for decades and is exclusively sold in vending machines in shopping centres and train/bus stations.", latitude: 43.06343818837067, longitude: 141.35728320461692, userRating: 3.5, mainPicture: "example_vm_1", picture2: "example_vm_2", picture3: "example_vm_3", picture4: "example_vm_4")
}
