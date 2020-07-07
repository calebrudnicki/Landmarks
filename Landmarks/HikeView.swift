//
//  HikeView.swift
//  Landmarks
//
//  Created by Caleb Rudnicki on 6/28/20.
//  Copyright © 2020 Caleb Rudnicki. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = self.move(edge: .trailing)
            .combined(with: opacity)
        let removal = self.scale
            .combined(with: opacity)
        return asymmetric(insertion: insertion, removal: removal)
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()

                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1.0)
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: hikeData[0])
                .padding()
            Spacer()
        }
    }
}

