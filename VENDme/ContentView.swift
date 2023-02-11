//
//  ContentView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import SwiftUI

struct ContentView: View {
//decides which image to use depending on what the VM sells
//    func typeImageChoice() -> String {
//        if vendingMachine.type == "Food" {
//            return "popcorn.fill"
//        } else if vendingMachine.type == "Drinks" {
//            return "mug.fill"
//        } else if vendingMachine.type == "Clothing" {
//            return "tshirt.fill"
//        } else if vendingMachine.type == "Household" {
//            return "house.fill"
//        } else if vendingMachine.type == "Toys" {
//            return "teddybear.fill"
//        } else if vendingMachine.type == "Gadgets" {
//            return "headphones"
//        } else if vendingMachine.type == "Memorabilia" {
//            return "theatermasks.fill"
//        } else {
//            return "person.fill.questionmark"
//        }
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geo in
                    Image("example_vm_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width * 1.0)
                        .ignoresSafeArea()
                }
                
                HStack {
                    Image("example_vm_1")
                        .resizable()
                        .border(.black, width: 3)
                        .cornerRadius(10)
                        .frame(width: 80, height: 60)
                    
                    Image("example_vm_2")
                        .resizable()
                        .border(.black, width: 1)
                        .cornerRadius(10)
                        .frame(width: 80, height: 60)
                    
                    Image("example_vm_3")
                        .resizable()
                        .border(.black, width: 1)
                        .cornerRadius(10)
                        .frame(width: 80, height: 60)
                    
                    Image("example_vm_4")
                        .resizable()
                        .border(.black, width: 1)
                        .cornerRadius(10)
                        .frame(width: 80, height: 60)
                }
                
                VStack {
                    HStack {
                        Text("Seventeen Ice")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        
                        
                        Spacer()
                        
                        HStack {
                            //if vendingMachine.inUse == true {
                                Image(systemName: "checkmark")
                                Text("In use")
                                    .fontWeight(.bold)
                            //} else {
                                //Image(systemName: "wrench.and.screwdriver.fill")
                                //Text("Not in use")
                                    //.fontWeight(.bold)
                            //}
                        }
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 1))
                        
                    }
                    
                    HStack {
                        Text("Sapporo, Japan")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.bottom)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "popcorn.fill")
                            Text("Food")
                                .fontWeight(.bold)
                        }
                    }
                    
                    HStack {
                        Button("Get directions") {
                            
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
                        Text("Selling various flavours of 'Seventeen Ice' ice-cream, including Crispy Strawberry, Choco Mille-Feuille, Custard Purin and Muscat. The brand has been around for decades and is exclusively sold in vending machines in shopping centres and train/bus stations.")
                    } header: {
                        Text("Description")
                    }
                    
                    Section {
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text("(73 check-ins)")
                            Spacer()
                            Button {
                                
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
                        3, Odorihigashi 1-Chōme
                        Sapporo
                        Hokkaido
                        Japan
                        060-0041
                        """)
                    } header: {
                        Text("Address")
                    }
                    
                    HStack {
                        Text("Add to favourites")
                        Image(systemName: "star")
                        Spacer()
                        Text("Report")
                        Image(systemName: "exclamationmark.bubble")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
