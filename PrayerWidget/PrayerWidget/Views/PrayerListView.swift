//
//  PrayerListView.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/26/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import SwiftUI


struct PrayerListView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    var body: some View {
        
        VStack {
            Text("Today")
                .fontWeight(.bold)
                .font(.system(size: 20))
            Spacer().frame(height: 5)
            HStack{
                VStack(alignment: .leading){
                    Text("Salah")
                        .fontWeight(.light)
                    //.font(.system(size: 14))
                    Spacer().frame(height: 5)
                    Text("Fajr")
                    Text("Ishraq")
                    Text("Zuhr")
                    Text("Asr")
                    Text("Maghrib")
                    Text("Ishaa")
                }.padding(.leading, 5)
                Spacer()
                VStack{
                    Text("Adhan")
                        .fontWeight(.light)
                    //.font(.system(size: 14))
                    Spacer().frame(height: 5)
                    Text("\(appEnvironment.todayPrayerTime!.FajrAdhan)")
                    Text("\(appEnvironment.todayPrayerTime!.Ishraq)")
                    Text("\(appEnvironment.todayPrayerTime!.ZuhrAdhan)")
                    Text("\(appEnvironment.todayPrayerTime!.AsrAdhan)")
                    Text("\(appEnvironment.todayPrayerTime!.MaghribAdhan)")
                    Text("\(appEnvironment.todayPrayerTime!.IshaaAdhan)")
                }
                Spacer()
                VStack{
                    Text("Iqama")
                        .fontWeight(.light)
                    //.font(.system(size: 14))
                    Spacer().frame(height: 5)
                    Text("\(appEnvironment.todayPrayerTime!.FajrIqama)")
                    Text("--------")
                    Text("\(appEnvironment.todayPrayerTime!.ZuhrIqama)")
                    Text("\(appEnvironment.todayPrayerTime!.AsrIqama)")
                    Text("\(appEnvironment.todayPrayerTime!.MaghribIqama)")
                    Text("\(appEnvironment.todayPrayerTime!.IshaaIqama)")
                }.padding(.trailing, 5)
            }
            
        }
    }
}

struct PrayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PrayerListView()
    }
}
