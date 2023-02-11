//
//  MapView.swift
//  VENDme
//
//  Created by Mark Strijdom on 11/02/2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var searchText = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.983341312795126, longitude: 138.25980299484613),
        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
    )
    
    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $region)
            }
            .navigationTitle("Locations")
        }
        .searchable(text: $searchText)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
