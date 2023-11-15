//
//  UserMapView.swift
//  RideShare
//
//  Created by Colstin Donaldson on 11/15/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct UserMapView: View {
    @State private var cameraPosition: MapCameraPosition = . region (.userRegion)
    let locationManager = CLLocationManager()
     
    var body: some View {
        Map(position: $cameraPosition){
            //Annotation("My Location", coordinate: .userLocation)
        }
            .onAppear {
                locationManager.requestWhenInUseAuthorization()
            }
  
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 36.018110, longitude: -115.124460)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init (center: .userLocation, 
                      latitudinalMeters: 10000,
                      longitudinalMeters: 10000)
    }
}

#Preview {
    UserMapView()
}
