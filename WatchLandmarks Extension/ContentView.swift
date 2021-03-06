//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by Caleb Rudnicki on 7/6/20.
//  Copyright © 2020 Caleb Rudnicki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList {
            WatchLandmarkDetail(landmark: $0)
        }
        .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList {
            WatchLandmarkDetail(landmark: $0)
            
        }
        .environmentObject(UserData())
    }
}
