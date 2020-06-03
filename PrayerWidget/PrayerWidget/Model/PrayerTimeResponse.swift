//
//  PrayerTimeResponse.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/24/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import Foundation

struct PrayerTime: Codable{
    let DATE: String
    let FajrAdhan: String
    let FajrIqama: String
    let Ishraq: String
    let ZuhrAdhan: String
    let ZuhrIqama: String
    let AsrAdhan: String
    let AsrIqama: String
    let MaghribAdhan: String
    let MaghribIqama: String
    let IshaaAdhan: String
    let IshaaIqama: String
}

struct PrayerTimeResponse: Codable{
    let prayerTimes: [PrayerTime]
}
