//
//  UserData.swift
//  Landmarks
//
//  Created by Caleb Rudnicki on 6/28/20.
//  Copyright © 2020 Caleb Rudnicki. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
