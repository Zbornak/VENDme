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
    
    @State private var imageOneShowing = true
    @State private var imageTwoShowing = false
    @State private var imageThreeShowing = false
    @State private var imageFourShowing = false
    
    @State private var showingDirectionsView = false
    @State private var showingReportView = false
    
    @State private var rating = 3
    
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
    
    @State private var userCheckIns = 0
    @State private var userCheckedIn = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if imageOneShowing {
                    Image(vendingMachine.mainPicture)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 1.0)
                        .shadow(radius: 10)
                } else if imageTwoShowing {
                    Image(vendingMachine.picture2)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 1.0)
                } else if imageThreeShowing {
                    Image(vendingMachine.picture3)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 1.0)
                } else {
                    Image(vendingMachine.picture4)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 1.0)
                }
                    
            HStack {
                Button {
                    imageOneShowing = true
                    imageTwoShowing = false
                    imageThreeShowing = false
                    imageFourShowing = false
                } label: {
                    Image(vendingMachine.mainPicture)
                        .resizable()
                        .border(.black, width: 3)
                        .cornerRadius(10)
                        .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                        .shadow(radius: 5)
                }
                
                Button {
                    imageOneShowing = false
                    imageTwoShowing = true
                    imageThreeShowing = false
                    imageFourShowing = false
                } label: {
                    Image(vendingMachine.picture2)
                        .resizable()
                        .border(.black, width: 1)
                        .cornerRadius(10)
                        .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                        .shadow(radius: 5)
                }
                
                Button {
                    imageOneShowing = false
                    imageTwoShowing = false
                    imageThreeShowing = true
                    imageFourShowing = false
                } label: {
                    Image(vendingMachine.picture3)
                        .resizable()
                        .border(.black, width: 1)
                        .cornerRadius(10)
                        .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                        .shadow(radius: 5)
                }
                
                Button {
                    imageOneShowing = false
                    imageTwoShowing = false
                    imageThreeShowing = false
                    imageFourShowing = true
                } label: {
                    Image(vendingMachine.picture4)
                        .resizable()
                        .border(.black, width: 1)
                        .cornerRadius(10)
                        .frame(maxWidth: geometry.size.width * 0.17, maxHeight: geometry.size.height * 0.07)
                        .shadow(radius: 5)
                }
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
                        Button {
                            showingDirectionsView.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "figure.walk")
                                Text("Directions")
                            }
                        }
                        .fontWeight(.bold)
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(.black, lineWidth: 1))
                        .sheet(isPresented: $showingDirectionsView) {
                            DirectionsView(vendingMachine: vendingMachine, userFavourites: UserFavourites(), locationManager: LocationManager())
                                .presentationDetents([.fraction(0.95)])
                                .presentationDragIndicator(.hidden)
                        }
                        
                        Spacer()
                        
                        if vendingMachine.userRating == 1 {
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        } else if vendingMachine.userRating == 2 {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        } else if vendingMachine.userRating == 3 {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        } else if vendingMachine.userRating == 4 {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                        } else {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        
                        Text("(\(vendingMachine.numberOfRatings))")
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
                            Image(systemName: "figure.wave")
                            Text("(\(userCheckIns) check-in\(userCheckIns == 1 ? "" : "s"))")
                            Spacer()
                            Button {
                                userCheckIns += 1
                                userCheckedIn = true
                            } label: {
                                Image(systemName: userCheckedIn ? "checkmark" : "magazine")
                                Text("Check in")
                            }
                            .fontWeight(.bold)
                            .buttonStyle(.borderedProminent)
                            .tint(.white)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(.black, lineWidth: 1))
                            .disabled(!userCheckedIn ? false : true)
                        }
                        
                        HStack {
                            Text("Rate this machine:")
                            Spacer()
                            RatingView(rating: $rating)
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
                    
                    Section {
                        Button {
                            userFavourites.favourites.insert(vendingMachine.id)
                        } label: {
                            HStack {
                                Text("Add to favourites")
                                Image(systemName: "star")
                            }
                        }
                        
                        Button {
                            showingReportView.toggle()
                        } label: {
                            HStack {
                                Text("Report a problem")
                                Image(systemName: "exclamationmark.bubble")
                            }
                        }
                        .sheet(isPresented: $showingReportView) {
                            ReportView(vendingMachine: vendingMachine)
                                .presentationDetents([.fraction(0.50)])
                                .presentationDragIndicator(.hidden)
                        }
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
