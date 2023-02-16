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
            ZStack(alignment: .bottom) {
                DirectionsMapView(vendingMachines: VendingMachines(), userFavourites: UserFavourites(), locationManager: LocationManager())
                    .ignoresSafeArea()
                
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
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "multiply")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
                .background(Color(red: 254.0 / 255.0, green: 222.0 / 255.0, blue: 121.0 / 255.0))
                .opacity(0.9)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
            }
        }
    }
}

struct DirectionsView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsView(locationManager: LocationManager())
    }
}
