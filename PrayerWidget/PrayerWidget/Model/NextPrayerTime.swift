//
//  NextPrayerTime.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/25/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import Foundation

struct NextPrayerTime{
    let prayerURL = "http://www.jannatconsulting.com/wic/prayer-times.json"
    
    func fetchPrayer(completionHandler: @escaping (PrayerTime)->()){
        performRequest(date: Date(), urlString: prayerURL, completionHandler: completionHandler)
    }
    
    func performRequest(date: Date, urlString: String, completionHandler: @escaping (PrayerTime)->()){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(date: date, dateData: safeData, completionHandler: completionHandler)
                }
            }
            task.resume()
        }
    }
    func parseJSON(date: Date, dateData: Data, completionHandler: @escaping (PrayerTime)->()) -> DateResponse? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([PrayerTime].self, from: dateData)
            for prayerTime in decodedData {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                let d = dateFormatter.date(from: prayerTime.DATE)!
                //print("comparing \(date)  \(d)")
                let order = Calendar.current.compare(date, to: d, toGranularity: .day)
                if order.rawValue == 0 {
                    completionHandler(prayerTime)
                }
            }
            //completionHandler(decodedData.data.[])
        } catch {
            print(error)
        }
        return nil
    }
}
