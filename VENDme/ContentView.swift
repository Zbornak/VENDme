//
//  ContentView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

struct ContentView: View {
    let vendingMachine: VendingMachine
    
    @State private var isFavourited = false
    
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
            VStack {
                ZStack {
                    Image(vendingMachine.mainPicture)
                        .resizable()
                        .scaledToFill()
                    
                    HStack {
                        Image(vendingMachine.mainPicture)
                            .resizable()
                            .border(.black, width: 3)
                            .cornerRadius(10)
                            .frame(width: 70, height: 50)
                            .shadow(radius: 5)

                        Image(vendingMachine.picture2)
                            .resizable()
                            .border(.black, width: 1)
                            .cornerRadius(10)
                            .frame(width: 70, height: 50)
                            .shadow(radius: 5)

                        Image(vendingMachine.picture3)
                            .resizable()
                            .border(.black, width: 1)
                            .cornerRadius(10)
                            .frame(width: 70, height: 50)
                            .shadow(radius: 5)

                        Image(vendingMachine.picture4)
                            .resizable()
                            .border(.black, width: 1)
                            .cornerRadius(10)
                            .frame(width: 70, height: 50)
                            .shadow(radius: 5)
                    }
                }
                
                VStack {
                    HStack {
                        Text(vendingMachine.name)
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        
                    Spacer()
                        
                    HStack {
                        if vendingMachine.inUse == true {
                            Image(systemName: "checkmark")
                            Text("In use")
                                .fontWeight(.bold)
                            } else {
                                Image(systemName: "wrench.and.screwdriver.fill")
                                Text("Not in use")
                                    .fontWeight(.bold)
                        }
                    }
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 1))
                        
                }
                    
                HStack {
                    Text("\(vendingMachine.city), \(vendingMachine.country)")
                        .font(.subheadline)
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
                .padding()
                
                Form {
                    Section {
                        Text(vendingMachine.description)
                    } header: {
                        Text("Description")
                    }
                    
                    Section {
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
                        Text("Let others know you've visited")
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
                        Text("Address")
                    }
                    
                HStack {
                    Button {
                        isFavourited = true
                        userFavourites.favourites.insert(vendingMachine.id)
                    } label: {
                        HStack {
                            Text("Add to favourites")
                            Image(systemName: isFavourited ? "checkmark" : "star")
                        }
                    }
                    Spacer()
                    Text("Report")
                    Image(systemName: "exclamationmark.bubble")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vendingMachine: VendingMachine.example, userFavourites: UserFavourites())
    }
}
