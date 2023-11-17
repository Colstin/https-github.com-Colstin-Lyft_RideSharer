//
//  UserMap2.swift
//  RideShare
//
//  Created by Colstin Donaldson on 11/16/23.
//

import SwiftUI
import MapKit

struct UserMapView: View {
    @StateObject var manager = LocationManager()
    @State var camera: MapCameraPosition = .userLocation(fallback: .automatic)
    
    let tower = CLLocationCoordinate2D(
        latitude: 43.64272145122822, 
        longitude: -79.38712117539345)
    
    let ago = CLLocationCoordinate2D(
        latitude: 43.653823848647725, 
        longitude: -79.3925230435043)
 
    let rom = CLLocationCoordinate2D(
        latitude: 43.66785712547134, 
        longitude: -79.39465908518817)
    
   
    
    var body: some View {
        Map(position: $camera) {
            Marker("CN Tower",systemImage: "building", coordinate: tower)
                .tint(.blue)
            
            Annotation("Art Gallery", coordinate: ago) {
                Image(systemName: "person.crop.artframe")
                    .foregroundStyle(.white)
                    .padding(3)
                    .background(.black)
            }
            
            Marker("Muesum", systemImage: "building.columns", coordinate: rom)
                .tint(.orange)
            
            UserAnnotation()
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
      
        
    }
}

#Preview {
    UserMapView()
}
