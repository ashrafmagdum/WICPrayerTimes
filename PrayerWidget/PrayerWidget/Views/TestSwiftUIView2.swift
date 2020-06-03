//
//  TestSwiftUIView.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/28/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import SwiftUI

struct TestSwiftUIView2: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @State var nowDate: Date = Date()
    
    var body: some View {
        
        VStack(){
            NextPrayerTimeSubView()
            PrayerCell(image: "", name: "", adhan: "Adhan", iqama: "Iqama")
            PrayerCell(image: "fajr", name: "Fajr", adhan: appEnvironment.todayPrayerTime!.FajrAdhan, iqama: appEnvironment.todayPrayerTime!.FajrIqama)
            PrayerCell(image: "ishraq", name: "Ishraq", adhan: appEnvironment.todayPrayerTime!.Ishraq, iqama: "")
            PrayerCell(image: "zuhr", name: "Zuhr", adhan: appEnvironment.todayPrayerTime!.ZuhrAdhan, iqama: appEnvironment.todayPrayerTime!.ZuhrIqama)
            PrayerCell(image: "asr", name: "Asr", adhan: appEnvironment.todayPrayerTime!.AsrAdhan, iqama: appEnvironment.todayPrayerTime!.AsrIqama)
            PrayerCell(image: "maghrib", name: "Maghrib", adhan: appEnvironment.todayPrayerTime!.MaghribAdhan, iqama: appEnvironment.todayPrayerTime!.MaghribIqama)
            PrayerCell(image: "ishaa", name: "Ishaa", adhan: appEnvironment.todayPrayerTime!.IshaaAdhan, iqama: appEnvironment.todayPrayerTime!.IshaaIqama)
            Spacer()
            
        }.padding().frame(alignment: .topLeading)
        
    }
    
}



struct TestSwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        TestSwiftUIView2()
    }
}

struct PrayerCell: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var image: String
    var name: String = ""
    var adhan: String
    var iqama: String
    
    
    var body: some View {
        
        VStack {
            HStack{
                Image("\(image)")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer().frame(width: 10)
                Text("\(name)")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .frame(width: 150, alignment: .leading)
                
                Spacer()
                Text("\(adhan)")
                    .frame(width: 80,alignment: .leading)
                Spacer()
                Text("\(iqama)")
                    .fontWeight(.bold)
                    .frame(width: 80,alignment: .leading)
                
                
                Spacer()
                
            }
            Rectangle()
                .frame(height: 1.0, alignment: .bottom)
                .foregroundColor(Color.gray)
        }
        
    }
}
struct NextPrayerTimeSubView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @State private var nextPrayer: NextPrayerTime = NextPrayerTime(name: "", iqama: "", start: "")
    @State var timeRemaining: String = ""
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        
        VStack {
            
            Text("Upcoming Prayer")
                .foregroundColor(Color.white)
            HStack {
                Text("\(nextPrayer.name)")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    .onAppear(perform: initRemainingTime)
                Text("\(timeRemaining)")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                    .onReceive(timer) { (input) in
                        self.updateRemainingTime()
                }
                
                
            }
        }.frame(maxWidth: .infinity, minHeight: 100, alignment: .center).background(LinearGradient(gradient: Gradient(colors: [.green, .yellow]), startPoint: .leading, endPoint: .trailing))
        
        
    }
    func updateRemainingTime(){
        let currentTimeInMinutes = PrayerTimeUtilities.shared.getMinutesAfterMidnight()
        let prayerTimeInMinutes = PrayerTimeUtilities.shared.convertStringTimeToMinute(self.nextPrayer.getIqamaTime())
        let timeRemaining = prayerTimeInMinutes - currentTimeInMinutes
        let currentDate = Date()
        let second = Calendar.current.component(.second, from: currentDate)
        let timeInterval: TimeInterval = Double(timeRemaining*60 + (60-second))
        self.timeRemaining = timeInterval.format(using: [.hour, .minute, .second])!
    }
    func initRemainingTime(){
        self.nextPrayer = PrayerTimeUtilities.shared.getNextPrayerTime(self.appEnvironment.todayPrayerTime!)!
        updateRemainingTime()
    }
    
}
extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        
        return formatter.string(from: self)
    }
}

