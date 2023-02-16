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
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.983341312795126, longitude: 138.25980299484613),
        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
    )
    @State private var useUserLocation = false
    
    @ObservedObject var vendingMachines: VendingMachines
    @ObservedObject var userFavourites: UserFavourites
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
                        Image(systemName: "arrow.triangle.swap")
                    }
                    .toolbar {
                        Button("Done") {
                            dismiss()
                        }
                    }
                }
            }
                    
            Map(coordinateRegion: useUserLocation ? $locationManager.region : $region, showsUserLocation: true, annotationItems: vendingMachines.machines) { vendingMachine in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: vendingMachine.latitude, longitude: vendingMachine.longitude)) {
                        NavigationLink(destination: ContentView(vendingMachine: vendingMachine, userFavourites: userFavourites)) {
                                Image(systemName: "lightswitch.off")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct DirectionsView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsView(vendingMachines: VendingMachines(), userFavourites: UserFavourites(), locationManager: LocationManager())
    }
}
