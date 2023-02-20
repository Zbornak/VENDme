//
//  ReportView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import SwiftUI

struct ReportView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var reportMessage = ""
    
    let vendingMachine: VendingMachine
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Report a problem with \(vendingMachine.name)")
                    .fontWeight(.bold)
                    .toolbar {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "multiply")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                
                TextField("Tell us what's wrong", text: $reportMessage)
                    .padding()
                
                Button {
                    //stuff to come here
                } label: {
                    HStack {
                        Image(systemName: "exclamationmark.bubble")
                        Text("Submit")
                    }
                }
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 25)
                    .stroke(.black, lineWidth: 1))
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(vendingMachine: VendingMachine.example)
    }
}
