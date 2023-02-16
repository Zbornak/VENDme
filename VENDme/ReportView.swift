//
//  ReportView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import SwiftUI

struct ReportView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Text("Report a problem")
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

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
