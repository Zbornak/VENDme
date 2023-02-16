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
    
    @ObservedObject var vendingMachines: VendingMachines
    @ObservedObject var userFavourites: UserFavourites
    @ObservedObject var locationManager: LocationManager
    
    @State private var currentLocation = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.983341312795126, longitude: 138.25980299484613),
        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
    )
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: vendingMachines.machines) { vendingMachine in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: vendingMachine.latitude, longitude: vendingMachine.longitude)) {
                            Image(systemName: "lightswitch.off")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                    }
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("From:")
                        TextField("enter yout current location", text: $currentLocation)
                    }
                    
                    HStack {
                        LocationButton(.shareCurrentLocation) {
                            locationManager.requestLocation()
                        }
                        .cornerRadius(30)
                        .labelStyle(.iconOnly)
                        .foregroundColor(.white)
                        
                        Text("or use my location")
                        Spacer()
                    }
                    
                    HStack {
                        Text("To (vending machine name here)")
                        Spacer()
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
        DirectionsView(vendingMachines: VendingMachines(), userFavourites: UserFavourites(), locationManager: LocationManager())
    }
}
