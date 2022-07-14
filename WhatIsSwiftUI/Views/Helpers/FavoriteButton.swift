//
//  FavoriteButton.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/13.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    //Binding. 문자 그대로 구속력이 있다. 다른 뷰에서 선언된 State 프로퍼티와
    //구속된다. 추후 각 랜드마크의 isFavorite State 변수에 구속된다.
    //뷰 외부에서 데이터를 가져오는게 EnvironmentObject와 비슷하지만,
    //Binding은 단순히 읽어오는것 뿐만 아니라 원 데이터 소스의 값까지 변경할 수 있다.
    var body: some View {
        Button { //버튼을 눌렀을때의 액션
            isSet.toggle() //토글: true->false, false->true
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
