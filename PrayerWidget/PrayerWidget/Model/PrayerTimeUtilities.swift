//
//  PrayerTimeUtilities.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/25/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import Foundation

class PrayerTimeUtilities{
    public static let shared = PrayerTimeUtilities()
    func getNextPrayerTime(_ prayerTime: PrayerTime) -> NextPrayerTime? {
        let minutesAfterMidnight = getMinutesAfterMidnight()
        if minutesAfterMidnight < convertStringTimeToMinute(prayerTime.FajrAdhan){
            return NextPrayerTime(name: "Fajr", iqama: prayerTime.FajrIqama, start: prayerTime.FajrAdhan )
        } else if minutesAfterMidnight < convertStringTimeToMinute(prayerTime.Ishraq){
            return NextPrayerTime(name: "Ishraq", iqama: "", start: prayerTime.Ishraq)
        }else if minutesAfterMidnight < convertStringTimeToMinute(prayerTime.ZuhrAdhan){
            return NextPrayerTime(name: "Zuhr", iqama: prayerTime.ZuhrIqama, start: prayerTime.ZuhrAdhan)
        }else if minutesAfterMidnight < convertStringTimeToMinute(prayerTime.AsrAdhan){
            return NextPrayerTime(name: "Asr", iqama: prayerTime.AsrIqama, start: prayerTime.AsrAdhan)
        }else if minutesAfterMidnight < convertStringTimeToMinute(prayerTime.MaghribAdhan){
            return NextPrayerTime(name: "Maghrib", iqama: prayerTime.MaghribIqama, start: prayerTime.MaghribIqama)
        }else if minutesAfterMidnight < convertStringTimeToMinute(prayerTime.IshaaAdhan){
            return NextPrayerTime(name: "Ishaa", iqama: prayerTime.IshaaIqama, start: prayerTime.IshaaAdhan)
        }
        return nil
    }
    
    func convertStringTimeToMinute(_ str: String) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let d = dateFormatter.date(from: str)!
        let hour = Calendar.current.component(.hour, from: d)
        let minute = Calendar.current.component(.minute, from: d)
        return (hour*60)+minute
        
    }
    func getMinutesAfterMidnight() -> Int{
        let date = Date()
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        return (60*hour) + minute
    }
    
}


struct NextPrayerTime {
    let name: String
    let iqama: String
    let start: String
    
    init(name: String, iqama: String, start: String){
        self.name = name
        self.iqama = iqama
        self.start = start
        
    }
    func getIqamaTime() -> String{
        if self.name == "Ishraq" {
            return self.start
        }
        return self.iqama
    }
}
