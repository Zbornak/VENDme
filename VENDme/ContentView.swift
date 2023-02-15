//
//  ContentView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

struct ContentView: View {
    let vendingMachine: VendingMachine
    
    @ObservedObject var userFavourites: UserFavourites
    
    func typeImageChoice() -> String {
        if vendingMachine.type == "Food" {
            return "popcorn.fill"
        } else if vendingMachine.type == "Drinks" {
            return "mug.fill"
        } else if vendingMachine.type == "Clothing" {
            return "tshirt.fill"
        } else if vendingMachine.type == "Household" {
            return "house.fill"
        } else if vendingMachine.type == "Toys" {
            return "teddybear.fill"
        } else if vendingMachine.type == "Gadgets" {
            return "headphones"
        } else if vendingMachine.type == "Memorabilia" {
            return "theatermasks.fill"
        } else {
            return "person.fill.questionmark"
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(vendingMachine.mainPicture)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: geometry.size.width * 1.0)
                    
            HStack {
                Image(vendingMachine.mainPicture)
                    .resizable()
                    .border(.black, width: 3)
                    .cornerRadius(10)
                    .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                    .shadow(radius: 5)
                        
                Image(vendingMachine.picture2)
                    .resizable()
                    .border(.black, width: 1)
                    .cornerRadius(10)
                    .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                    .shadow(radius: 5)
                        
                Image(vendingMachine.picture3)
                    .resizable()
                    .border(.black, width: 1)
                    .cornerRadius(10)
                    .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                    .shadow(radius: 5)
                        
                Image(vendingMachine.picture4)
                    .resizable()
                    .border(.black, width: 1)
                    .cornerRadius(10)
                    .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                    .shadow(radius: 5)
                }
                
                VStack {
                    HStack {
                        Text("\(vendingMachine.city), \(vendingMachine.country)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: typeImageChoice())
                            Text(vendingMachine.type)
                                .fontWeight(.bold)
                        }
                    }
                    
                    HStack {
                        Button("Get directions") {
                            //stuff to come here
                        }
                        .fontWeight(.bold)
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(.black, lineWidth: 1))
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.leadinghalf.filled")
                        Image(systemName: "star")
                        Text("(37)")
                    }
                }
                .padding(.horizontal)
                
                Form {
                    Section {
                        Text(vendingMachine.description)
                    } header: {
                        Text("description")
                    }
                    
                    Section {
                        HStack {
                            Text("status:")
                            Spacer()
                            HStack {
                                if vendingMachine.inUse == true {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.green)
                                    Text("In use")
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                } else {
                                    Image(systemName: "wrench.and.screwdriver.fill")
                                        .foregroundColor(.red)
                                    Text("Not in use")
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text("(73 check-ins)")
                            Spacer()
                            Button {
                                //stuff to come here
                            } label: {
                                Image(systemName: "hand.raised.fingers.spread")
                                Text("Check in")
                            }
                            .fontWeight(.bold)
                            .buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(.black, lineWidth: 1))
                        }
                        
                        HStack {
                            Text("Rate this machine:")
                            Spacer()
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        }
                        
                    } header: {
                        Text("information")
                    }
                    
                    Section {
                        Text("""
                        \(vendingMachine.street)
                        \(vendingMachine.city)
                        \(vendingMachine.region)
                        \(vendingMachine.country)
                        \(vendingMachine.postcode)
                        """)
                    } header: {
                        Text("address")
                    }
                    
                    HStack {
                        Button {
                            userFavourites.favourites.insert(vendingMachine.id)
                        } label: {
                            HStack {
                                Text("Add to favourites")
                                Image(systemName: "star")
                            }
                        }
                        Spacer()
                        Text("Report")
                        Image(systemName: "exclamationmark.bubble")
                    }
                }
                .navigationTitle(vendingMachine.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vendingMachine: VendingMachine.example, userFavourites: UserFavourites())
    }
}
