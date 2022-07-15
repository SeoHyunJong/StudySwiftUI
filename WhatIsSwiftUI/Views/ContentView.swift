//
//  ContentView.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/12.
//

import SwiftUI
// 주의! 구조체는 View protocol을 상속하는 것이 아닌 채택 adopt하는 것이다!
struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab{
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) { //selection에 따라 뷰가 바뀜
            CategoryHome()
                .tabItem{
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
