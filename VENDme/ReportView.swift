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
            VStack (alignment: .leading) {
                Text("Report a problem with \(vendingMachine.name)")
                    .padding()
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
                    .submitLabel(.send)
                    .onSubmit {
                        print("hello")
                        //add code that will submit contents of TextField
                    }
                
                TextField("Tell us what's wrong", text: $reportMessage, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5)
                    .padding()
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(vendingMachine: VendingMachine.example)
    }
}
