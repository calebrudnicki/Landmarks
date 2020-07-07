//
//  WatchMapView.swift
//  WatchLandmarks Extension
//
//  Created by Caleb Rudnicki on 7/6/20.
//  Copyright © 2020 Caleb Rudnicki. All rights reserved.
//

import SwiftUI

struct WatchMapView: WKInterfaceObjectRepresentable {
    var landmark: Landmark
    
    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) -> WKInterfaceMap {
        return WKInterfaceMap()
    }
    
    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: landmark.locationCoordinate, span: span)
        
        map.setRegion(region)
    }
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMapView(landmark: UserData().landmarks[0])
    }
}
