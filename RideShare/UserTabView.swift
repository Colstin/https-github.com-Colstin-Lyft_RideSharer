//
//  TabView.swift
//  RideShare
//
//  Created by Colstin Donaldson on 11/15/23.
//

import SwiftUI

struct UserTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            UserListView()
                .tabItem {
                    Image(systemName: "checklist.unchecked")
                }.tag(0)
            
            UserMapView()
                .tabItem {
                    Image(systemName: "map")
                }.tag(1)
        }
    }
}

#Preview {
    UserTabView()
}
