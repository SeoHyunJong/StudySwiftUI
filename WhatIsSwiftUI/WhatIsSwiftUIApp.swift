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
            //서브뷰에서 EnvironmentObject를 사용하고 있기 때문에 modifier를 추가해준다.
            //Object로 넘어간 이 modelData는 EnrivronmentObject를 사용하는 모든 child 뷰에서 읽어올 수 있다.
            //따라서 modelData는 LandmarkList의 그것과 공유하고 있다.
        }
    }
}
