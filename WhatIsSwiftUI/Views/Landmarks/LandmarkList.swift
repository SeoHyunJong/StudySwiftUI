//
//  LandmarkList.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/12.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in //Swift의 강력한 기능 filter. 조건에 따르는 Filtered Array를 반환해준다.
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View{
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{ //네비게이션 링크를 타고 들어올때 나오는 뷰
                        LandmarkDetail(landmark: landmark)
                    } label: { //링크의 이름들
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}
//List와 ForEach의 차이? List는 UIScrollView에 가깝고, ForEach는 UITableView와 가깝다.
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        //Preview를 위해 임시로 ModelData()를 생성해서 던져주었다.
    }
}
