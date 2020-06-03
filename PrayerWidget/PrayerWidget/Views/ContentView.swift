//
//  ContentView.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/23/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var hijriDate = ""
    @State private var prayerTimes = ""
    @State private var nextPrayer: NextPrayerTime = NextPrayerTime(name: "", iqama: "", start: "")
    @EnvironmentObject var appEnvironment: AppEnvironment
    let dateManager = DateManager()
    let prayerTimeManager = PrayerTimeManager()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("\(hijriDate)")
                    .fontWeight(.bold)
                    .onAppear(perform: loadData)
                    .font(.system(size: 18))
                Spacer().frame(height: 10)
                VStack(alignment: .leading){
                    Text("Next time for:")
                        .font(.system(size: 16))
                    HStack(){
                        Text("\(nextPrayer.name)")
                            .fontWeight(.bold)
                            .font(.system(size: 26))
                        Spacer().frame(width: 100)
                        VStack(alignment: .leading){
                            Text("Adhan")
                            Text("\(nextPrayer.start)")
                                .font(.system(size: 20))
                        }
                        Spacer()
                            .frame(width: 20)
                        VStack(alignment: .leading){
                            Text("Iqama")
                            Text("\(nextPrayer.iqama)")
                                .font(.system(size: 20))
                        }
                        
                        
                    }
                    NavigationLink(destination: TestSwiftUIView2().environmentObject(appEnvironment)){
                        Text("See all prayers")
                            .font(.system(size:18))
                    }
                    
                    
                }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: 100, alignment: .center).overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1)).padding([.horizontal],20)
                
            }.navigationBarTitle("Home")
            
        }
    }
    func loadData(){
        prayerTimeManager.fetchPrayerTimes{(received) in
            self.prayerTimes = "\(received.FajrAdhan)"
            self.nextPrayer = PrayerTimeUtilities.shared.getNextPrayerTime(received)!
            self.appEnvironment.todayPrayerTime = received
            let minutesInDay = 24 * 60
            let maghribMinutes = PrayerTimeUtilities.shared.convertStringTimeToMinute(received.MaghribAdhan)
            let currentMinute = PrayerTimeUtilities.shared.getMinutesAfterMidnight()
            var adjustment = false
            if(currentMinute > maghribMinutes && currentMinute < minutesInDay){
                adjustment = true
                
            }
            self.dateManager.fetchHijriDate(adjustment){ (received) in
                self.hijriDate = "\(received.weekday.en), \(received.month.en) \(received.day), \(received.year) \(received.designation.abbreviated)"
                self.appEnvironment.todaysHijriDate = self.hijriDate
                
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
