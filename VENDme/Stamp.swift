//
//  Stamp.swift
//  VENDme
//
//  Created by Mark Strijdom on 20/02/2023.
//

import SwiftUI

struct Stamp: View {
    let vendingMachine: VendingMachine
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(vendingMachine.mainPicture)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(100)
                    .overlay(RoundedRectangle(cornerRadius: 100)
                        .stroke(Color(red: 212 / 255, green: 175 / 255, blue: 55 / 255), lineWidth: 10))
                    .shadow(radius: 10)
                    .frame(maxWidth: geometry.size.width * 1.0)
                    .padding()
                
                HStack {
                    Spacer()
                        .padding()
                    
                    Image(systemName: "checkmark.seal")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.3)
                        .padding(.leading)
                        .foregroundColor(Color(red: 212 / 255, green: 175 / 255, blue: 55 / 255))
                }
            }
        }
    }
}

struct Stamp_Previews: PreviewProvider {
    static var previews: some View {
        Stamp(vendingMachine: VendingMachine.example)
    }
}
