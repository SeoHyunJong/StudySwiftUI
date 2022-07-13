//
//  ContentView.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/12.
//

import SwiftUI
// 주의! 구조체는 View protocol을 상속하는 것이 아닌 채택 adopt하는 것이다!
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
        //ContentView의 서브뷰 LandmarkList에서 EnvironmentObject 프로퍼티 래퍼를
        //사용하고 있기 때문에 마찬가지로 이 modifier를 넣어준다.
    }
}
