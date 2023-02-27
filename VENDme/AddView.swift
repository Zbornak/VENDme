//
//  AddView.swift
//  VENDme
//
//  Created by Mark Strijdom on 14/02/2023.
//

import SwiftUI

struct AddView: View {
    let vendingMachineTypes = ["drinks", "clothing", "food", "household", "toys", "gadgets", "memorabilia", "other"]
    
    @State private var vendingMachineTypeChoice = "drinks"
    
    @State private var isInUse = true
    
    @State private var rating = 3
    
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
                Button {
                    //stuff to come here
                } label: {
                    HStack {
                        Image(systemName: "figure.wave")
                        Text("I'm there now")
                    }
                }
            } header: {
                Text("use your location")
            }
            
            Section {
                Picker("What does it sell?", selection: $vendingMachineTypeChoice) {
                    ForEach(vendingMachineTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("In use?", isOn: $isInUse)
            }
            
            Section {
                Text("Enter description here...")
                    .foregroundColor(.secondary)
            } header: {
                Text("brief description (180 words or less)")
            }
            
            Section {
                HStack {
                    Text("Rate this machine:")
                    Spacer()
                    RatingView(rating: $rating)
                }
            } header: {
                Text("rate this vending machine")
            }
            
            Button {
                    //stuff to come here
            } label: {
                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: "plus")
                        Text("Add machine for review")
                    }
                    
                    Spacer()
                }
            }
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(.black, lineWidth: 1))
                .padding()
        }
        .navigationTitle("Add a Vending Machine")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
