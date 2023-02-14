//
//  VendingMachines.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import Foundation

class VendingMachines: ObservableObject {
    
    @Published var machines: [VendingMachine]
    
    var primary: VendingMachine {
        machines[0]
    }
    
    init() {
        let url = Bundle.main.url(forResource: "VMInformation", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        machines = try! JSONDecoder().decode([VendingMachine].self, from: data)
    }
}
