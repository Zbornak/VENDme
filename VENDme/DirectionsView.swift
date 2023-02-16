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
    
    let vendingMachine: VendingMachine
    
    @ObservedObject var userFavourites: UserFavourites
    
    @ObservedObject var locationManager: LocationManager
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.983341312795126, longitude: 138.25980299484613),
        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
    )
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: [vendingMachine]) { vendingMachine in
                    MapAnnotation(coordinate: vendingMachine.coordinates) {
                            Image(systemName: "lightswitch.off")
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                    }
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("\(vendingMachine.street)")
                    Text("\(vendingMachine.city)")
                    
                    HStack {
                        Text("\(vendingMachine.region)")
                        Spacer()
                        Button {
                            //stuff here
                        } label: {
                            HStack {
                                Text("Directions")
                                Image(systemName: "info.square")
                            }
                        }
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
        DirectionsView(vendingMachine: VendingMachine.example, userFavourites: UserFavourites(), locationManager: LocationManager())
    }
}
