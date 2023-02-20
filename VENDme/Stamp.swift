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
                    .cornerRadius(110)
                    .overlay(RoundedRectangle(cornerRadius: 110)
                    .stroke(.red, lineWidth: 10))
                    .shadow(radius: 10)
                    .frame(maxWidth: geometry.size.width * 1.0)
                    .padding()
                
                HStack {
                    Spacer()
                        .padding()
                    
                    Image(systemName: "checkmark.seal")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 10)
                        .frame(maxWidth: geometry.size.width * 0.3)
                        .padding(.leading)
                        .foregroundColor(.red)
                }
                .padding()
            }
        }
    }
}

struct Stamp_Previews: PreviewProvider {
    static var previews: some View {
        Stamp(vendingMachine: VendingMachine.example)
    }
}
