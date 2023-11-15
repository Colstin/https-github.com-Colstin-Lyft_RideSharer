//
//  UserListView.swift
//  RideShare
//
//  Created by Colstin Donaldson on 11/15/23.
//

import SwiftUI

struct UserListView: View {
    @State private var showAlert = false
    private let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
                       ("Driver: Sandra, 01/03/2022", "$13.10"),
                       ("Driver: Hank, 01/11/2022", "$16.20"),
                       ("Driver: Michelle, 01/19/2022", "$8.50")]
    
    @State private var alertText = ""
    
    var body: some View {
        NavigationStack {
            List(rideHistory, id: \.0) { ride in
                HStack{
                    Text(ride.0)
                }
                .onTapGesture {
                    showAlert = true
                    alertText = ride.1
                }
                .listRowInsets(EdgeInsets(top: 50, leading: 20, bottom: 20, trailing: 0))
                .alert("Price", isPresented: $showAlert, actions: {
                      Button("OK", role: .cancel, action: { showAlert = false })
                    }, message: {
                        Text(alertText)
                    })
                
            }
            .navigationTitle("Rider list")
        }
    }
}

#Preview {
    UserListView()
}
