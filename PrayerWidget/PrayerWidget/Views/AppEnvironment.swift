//
//  AppEnvironment.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/27/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import Foundation
import SwiftUI


class AppEnvironment: ObservableObject {
    @Published var todayPrayerTime: PrayerTime?
    @Published var todaysHijriDate: String?
    @Published var todaysGDate: String?
}
