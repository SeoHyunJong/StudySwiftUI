//
//  WhatIsSwiftUIApp.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/12.
//

import SwiftUI

@main
struct WhatIsSwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    //ObservedObject와 거의 똑같으나 StateObject는 하나의 객체가 만들어지고, View가 얼마나 초기화되든지 상관없이
    //별개의 객체로 관리된다.
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
            //마찬가지로 여기에 이 modifier를 추가해준다.
        }
    }
}
