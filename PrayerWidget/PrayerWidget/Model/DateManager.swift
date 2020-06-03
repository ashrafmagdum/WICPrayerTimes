//
//  DateManager.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/23/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import Foundation
import UIKit


struct DateManager {
    
    let dateURL = "https://api.aladhan.com/v1/gToH?adjustment="
    
    func fetchHijriDate(_ adjustment: Bool ,completionHandler: @escaping (Hijri)->()) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let result = formatter.string(from: date)
        let urlString = "\(dateURL)\(adjustment ? 1 : 0)&date=\(result)"
        print(urlString)
        performRequest(urlString: urlString, completionHandler: completionHandler)
    }
    func performRequest(urlString: String, completionHandler: @escaping (Hijri)->()){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(dateData: safeData, completionHandler: completionHandler)
                }
            }
            task.resume()
        }
    }
    func parseJSON(dateData: Data, completionHandler: @escaping (Hijri)->()) -> DateResponse? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(DateResponse.self, from: dateData)
            completionHandler(decodedData.data.hijri)
        } catch {
            print(error)
        }
        return nil
    }
    
}





