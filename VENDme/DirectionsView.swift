//
//  DirectionsView.swift
//  VENDme
//
//  Created by Mark Strijdom on 15/02/2023.
//

import CoreLocation
import CoreLocationUI
import MapKit
import SwiftUI

struct DirectionsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentLocation = ""
    @State private var desiredLocation = ""
    @ObservedObject var locationManager: LocationManager
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("From:")
                        TextField("Current location", text: $currentLocation)
                    }
                        
                    HStack {
                        LocationButton(.shareCurrentLocation) {
                            locationManager.requestLocation()
                        }
                        .cornerRadius(30)
                        .labelStyle(.iconOnly)
                        .foregroundColor(.white)
                            
                        Text("Use current location")
                        Spacer()
                    }
                }
                    
                Section {
                    HStack {
                        Text("To:")
                        TextField("To", text: $desiredLocation)
                    }
                    .toolbar {
                        Button("Done") {
                            dismiss()
                        }
                    }
                }
                
                Section {
                    
                }
            }
        }
    }
}

struct DirectionsView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsView(locationManager: LocationManager())
    }
}
