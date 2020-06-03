//
//  TestSwiftUIView.swift
//  PrayerWidget
//
//  Created by Ashraf Magdum on 4/28/20.
//  Copyright © 2020 Ashraf Magdum. All rights reserved.
//

import SwiftUI

struct TestSwiftUIView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    var body: some View {
        //Text("Hello")
        List{
            HStack{
                Image("sun.min")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer().frame(width: 10)
                VStack(alignment: .leading){
                    Text("Fajr")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    HStack{
                        Text("Adhan: \(appEnvironment.todayPrayerTime!.FajrAdhan)")
                        Spacer()
                        Text("Iqama: \(appEnvironment.todayPrayerTime!.FajrIqama) ")
                    }
                }
            }
            HStack{
                Image("sunrise")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer().frame(width: 10)
                VStack(alignment: .leading){
                    Text("Ishraq")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    HStack{
                        Text("Start: \(appEnvironment.todayPrayerTime!.Ishraq)")
                    }
                }
            }
            HStack{
                Image("sun.max")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer().frame(width: 10)
                VStack(alignment: .leading){
                    Text("Thuhr")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    HStack{
                        Text("Adhan: \(appEnvironment.todayPrayerTime!.ZuhrAdhan)")
                        Spacer()
                        Text("Iqama: \(appEnvironment.todayPrayerTime!.ZuhrIqama) ")
                    }
                }
            }
            HStack{
                Image("sun.dust")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer().frame(width: 10)
                VStack(alignment: .leading){
                    Text("Asr")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    HStack{
                        Text("Adhan: \(appEnvironment.todayPrayerTime!.AsrAdhan)")
                        Spacer()
                        Text("Iqama: \(appEnvironment.todayPrayerTime!.AsrIqama) ")
                    }
                }
            }
            HStack{
                Image("sunset")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer().frame(width: 10)
                VStack(alignment: .leading){
                    Text("Maghrib")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    HStack{
                        Text("Adhan: \(appEnvironment.todayPrayerTime!.MaghribAdhan)")
                        Spacer()
                        Text("Iqama: \(appEnvironment.todayPrayerTime!.MaghribIqama) ")
                    }
                }
            }
            HStack{
                Image("moon.stars")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer().frame(width: 10)
                VStack(alignment: .leading){
                    Text("Ishaa")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    HStack{
                        Text("Adhan: \(appEnvironment.todayPrayerTime!.IshaaAdhan)")
                        Spacer()
                        Text("Iqama: \(appEnvironment.todayPrayerTime!.IshaaIqama) ")
                    }
                }
            }
            
        }.navigationBarTitle("Today's Prayer Times")
    
        
    }
}



struct TestSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestSwiftUIView()
    }
}
