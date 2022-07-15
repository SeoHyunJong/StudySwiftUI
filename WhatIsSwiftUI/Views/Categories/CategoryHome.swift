//
//  CategoryHome.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/15.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset) //뭐가 이렇게 모디파이어가 많아
            .navigationTitle("Featured")
            .toolbar{
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage:  "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) { //isPresented가 true일때 모달 뷰를 띄운다.
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
