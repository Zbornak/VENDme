//
//  MapView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import CoreLocationUI
import MapKit
import SwiftUI

struct MapView: View {
    @ObservedObject var vendingMachines: VendingMachines
    
    @ObservedObject var userFavourites: UserFavourites
    
    @ObservedObject var locationManager: LocationManager
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.983341312795126, longitude: 138.25980299484613),
        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
    )
    
    var body: some View {
        VStack(alignment: .trailing) {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.none), annotationItems: vendingMachines.machines) { vendingMachine in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: vendingMachine.latitude, longitude: vendingMachine.longitude)) {
                    NavigationLink(destination: ContentView(vendingMachine: vendingMachine, userFavourites: userFavourites)) {
                        Image(systemName: "lightswitch.off")
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationTitle("Discover")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(vendingMachines: VendingMachines(), userFavourites: UserFavourites(), locationManager: LocationManager())
    }
}
