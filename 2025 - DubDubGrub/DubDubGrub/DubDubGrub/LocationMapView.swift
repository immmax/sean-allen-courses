//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Maxim Datskiy on 5/21/25.
//

import MapKit
import SwiftUI

struct LocationMapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            
            VStack {
                Image(.ddgMapLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .shadow(radius: 10)
                 
                Spacer()
            }
        }
    }
}

#Preview {
    LocationMapView()
}
