//
//  DirectionsView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import SwiftUI

struct DirectionsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Text("Get directions")
                .toolbar {
                    Button("Done") {
                        dismiss()
                }
            }
        }
    }
}

struct DirectionsView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsView()
    }
}
