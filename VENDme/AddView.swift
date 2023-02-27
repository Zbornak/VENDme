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
    
    @State private var machineSubmitted = false
    
    @Binding var numberOfRatings: Int
    
    @Binding var userHasLeftRating: Bool
    
    var body: some View {
        if machineSubmitted == false {
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
                        RatingView(rating: $rating, numberOfRatings: $numberOfRatings, userHasLeftRating: $userHasLeftRating)
                    }
                } header: {
                    Text("rate this vending machine")
                }
                
                Button {
                    machineSubmitted = true
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
        } else {
            VStack {
                Image("vending_machine_pixel_art")
                
                Text("Many thanks for your submission, someone will check it out and it should be live soon.")
                    .padding()
                
                Button {
                    machineSubmitted = false
                } label: {
                    HStack {
                        HStack {
                            Image(systemName: "checkmark")
                            Text("Back")
                        }
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
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(numberOfRatings: .constant(0), userHasLeftRating: .constant(true))
    }
}
