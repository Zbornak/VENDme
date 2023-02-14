//
//  AddView.swift
//  VENDme
//
//  Created by Mark Strijdom on 14/02/2023.
//

import SwiftUI

struct AddView: View {
    var body: some View {
        Form {
            Section {
                Text("Name:")
            } header: {
                Text("vending machine name")
            }
            
            Section {
                Text("Street:")
                Text("City:")
                Text("Region:")
                Text("Country:")
                Text("Postcode:")
            } header: {
                Text("vending machine address")
            }
            
            Section {
                Text("Name:")
            } header: {
                Text("what does it sell?")
            }
            
            Text("Name:")
            Text("Name:")
            
        }
        .navigationTitle("Add a Vending Machine")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
