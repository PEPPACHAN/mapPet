//
//  ContentView.swift
//  mapPet
//
//  Created by PEPPA CHAN on 28.06.2024.
//

import SwiftUI
import MapKit


struct MapView: View {

    let manager = CLLocationManager()
    let testPoint: CLLocationCoordinate2D = .init(latitude: 42.967670, longitude: 47.540172)
    let testPoint2: CLLocationCoordinate2D = .init(latitude: 42.965763, longitude: 47.544174)
    
    @State private var route: MKRoute?
    @State private var selection: Int?
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @Namespace var mainMap
    
    var body: some View {
        Map(position: $position, interactionModes: [.pan, .zoom, .rotate], selection: $selection, scope: mainMap){
            UserAnnotation()
            Marker("myCar", systemImage: "car", coordinate: testPoint)
                .tag(1)
            
            MapPolyline(coordinates: [testPoint, testPoint2], contourStyle: .straight)
                .stroke(.blue, lineWidth: 10)
        }
        .onAppear{
            manager.requestWhenInUseAuthorization()
        }
        .mapStyle(.standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            MapUserLocationButton(scope: mainMap)
                .padding()
                .buttonBorderShape(.circle)
        }
        .mapScope(mainMap)
    }
}

extension MapContainerView {
    
}

#Preview {
    MapView()
}

//latitude: 42.967670, longitude: 47.540172
//latitude: 42.965763, longitude: 47.544174
//latitude: 37.33841, longitude: -122.01247
