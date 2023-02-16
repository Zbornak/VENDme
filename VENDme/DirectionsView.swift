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
    
    @ObservedObject var locationManager: LocationManager
    
    @State private var currentLocation = ""
    @State private var desiredLocation = ""
    
    var body: some View {
        NavigationView {
            VStack {
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
                
                HStack {
                    Text("To:")
                    TextField("To", text: $desiredLocation)
                    Image(systemName: "arrow.triangle.swap")
                }
                .toolbar {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .padding()
        }
    }
}

struct DirectionsView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsView(locationManager: LocationManager())
    }
}
