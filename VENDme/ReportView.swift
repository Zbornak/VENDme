//
//  ReportView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import SwiftUI

struct ReportView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState private var nameIsFocused: Bool
    
    @State private var reportMessage = ""
    @State private var userSubmittedReport = false
    
    let vendingMachine: VendingMachine
    
    var body: some View {
        NavigationView {
            if !userSubmittedReport {
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
                    
                    TextField("Tell us what's wrong", text: $reportMessage, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(5)
                        .padding()
                    
                    Button {
                        userSubmittedReport = true
                        nameIsFocused = false
                    } label: {
                        HStack {
                            Image(systemName: "exclamationmark.bubble.fill")
                            Text("Report")
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
            } else {
                VStack {
                    Image("vending_machine_pixel_art")
                    Text("Many thanks for letting us know.")
                        .toolbar {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "multiply")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        }
                }
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(vendingMachine: VendingMachine.example)
    }
}
