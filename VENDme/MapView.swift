//
//  MapView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    var vendingMachines: VendingMachines
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.983341312795126, longitude: 138.25980299484613),
        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
    )
    
    @State var useUserLocation = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    useUserLocation.toggle()
                } label: {
                    Label("Use my location", systemImage: useUserLocation ? "location.circle.fill" : "location.circle")
                }
                .padding(.leading)
                Spacer()
            }
            
            Map(coordinateRegion: $region, annotationItems: vendingMachines.machines) { vendingMachine in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: vendingMachine.latitude, longitude: vendingMachine.longitude)) {
                    NavigationLink(destination: ContentView(vendingMachine: vendingMachine)) {
                        Image(systemName: "lightswitch.off")
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(vendingMachines: VendingMachines())
    }
}
