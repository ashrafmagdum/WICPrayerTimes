//
//  DateData.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/23/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import Foundation

struct DateResponse: Codable {
    let data: DateData
    let code: Int
    let status: String

}
struct DateData: Codable {
    let hijri: Hijri
}

struct Hijri: Codable {
    let date: String
    let format: String
    let day: String
    let weekday: Weekday
    let month: Month
    let year: String
    let designation: Designation
}
struct Weekday: Codable{
    let en: String
    let ar: String
}
struct Month: Codable{
    let number: Int
    let en: String
    let ar: String
}
struct Designation: Codable{
    let abbreviated: String
    let expanded: String
}
struct Gregorian: Codable{
    let en: String
}
