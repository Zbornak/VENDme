//
//  DirectionsMapView.swift
//  VENDme
//
//  Created by Mark Strijdom on 16/02/2023.
//

import CoreLocation
import CoreLocationUI
import MapKit
import SwiftUI

struct DirectionsMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.983341312795126, longitude: 138.25980299484613),
        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
    )
    @State private var useUserLocation = false
    
    @ObservedObject var vendingMachines: VendingMachines
    @ObservedObject var userFavourites: UserFavourites
    @ObservedObject var locationManager: LocationManager
    
    var body: some View {
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

struct DirectionsMapView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsMapView(vendingMachines: VendingMachines(), userFavourites: UserFavourites(), locationManager: LocationManager())
    }
}
