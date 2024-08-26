//
//  MapAppView.swift
//  SDKCom
//
//  Created by brubru on 18.08.2024.
//

import SwiftUI
import MapKit

struct MapAppView: View {
//	@EnvironmentObject private var root: Root
	
	@State private var region: MKCoordinateRegion = MKCoordinateRegion(
		center: CLLocationCoordinate2D(latitude: 53.208559, longitude: 50.228850),
		span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
	  
	var body: some View {
		VStack(spacing: 0 ){
			Map(coordinateRegion: $region).edgesIgnoringSafeArea(.all)
		}
	}
}

#Preview {
	MapAppView()
//		.environmentObject(Root.shared)
}
