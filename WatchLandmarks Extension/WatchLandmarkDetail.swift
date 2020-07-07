//
//  WatchLandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by Caleb Rudnicki on 7/6/20.
//  Copyright © 2020 Caleb Rudnicki. All rights reserved.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: self.landmark.image.resizable())
                    .scaledToFit()
                
                Text(self.landmark.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Toggle(isOn: $userData.landmarks[self.landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(self.landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(self.landmark.state)
                    .font(.caption)
                
                WatchMapView(landmark: self.landmark)
                    .scaledToFit()
                    .padding()
            }
            .padding(16)
        }
        .navigationBarTitle("Landmarks")
    }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return Group {
            WatchLandmarkDetail(landmark: userData.landmarks[0])
            .environmentObject(userData)
            .previewDevice("Apple Watch Series 4 - 44mm")
            
            WatchLandmarkDetail(landmark: userData.landmarks[1])
            .environmentObject(userData)
            .previewDevice("Apple Watch Series 2 - 38mm")
        }
    }
}
