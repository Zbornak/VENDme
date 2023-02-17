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
    
    @State private var showingWrittenDirections = false
    
    @State private var directions: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                DirectionsMapView(vendingMachine: vendingMachine, userFavourites: UserFavourites(), locationManager: LocationManager(), directions: $directions)
                    .ignoresSafeArea()
                
                Button {
                    self.showingWrittenDirections.toggle()
                } label: {
                    HStack {
                        Image(systemName: "figure.walk")
                        Text("Show step-by-step directions")
                    }
                }
                .disabled(directions.isEmpty)
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(.black, lineWidth: 1))
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
        .sheet(isPresented: $showingWrittenDirections, content: {
            VStack {
                Text("Directions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    
                Divider().background(.blue)
                    
                List {
                    ForEach(0..<self.directions.count, id: \.self) { direction in
                            Text(self.directions[direction])
                                .padding()
                    }
                }
            }
        })
    }
}

struct DirectionsView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionsView(vendingMachine: VendingMachine.example, userFavourites: UserFavourites(), locationManager: LocationManager())
    }
}

struct DirectionsMapView: UIViewRepresentable {
    let vendingMachine: VendingMachine
    
    @ObservedObject var userFavourites: UserFavourites
    
    @ObservedObject var locationManager: LocationManager
    
    typealias UIViewType = MKMapView
    
    @Binding var directions: [String]
    
    
    func makeCoordinator() -> DirectionsMapViewCoordinator {
        return DirectionsMapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let directionsMapView = MKMapView()
        directionsMapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 36.983341312795126, longitude: 138.25980299484613),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        directionsMapView.setRegion(region, animated: true)
        
        let userPosition = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: locationManager.location?.latitude ?? 0.0, longitude: locationManager.location?.longitude ?? 0.0))
        
        let VMPosition = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: vendingMachine.coordinates.latitude, longitude: vendingMachine.coordinates.longitude))
        
        let directionsRequest = MKDirections.Request()
        directionsRequest.source = MKMapItem(placemark: userPosition)
        directionsRequest.destination = MKMapItem(placemark: VMPosition)
        directionsRequest.transportType = .walking
        
        let directions = MKDirections(request: directionsRequest)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            directionsMapView.addAnnotations([userPosition, VMPosition])
            directionsMapView.addOverlay(route.polyline)
            directionsMapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),animated: true)
            
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
        
        return directionsMapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    class DirectionsMapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
    }
}
