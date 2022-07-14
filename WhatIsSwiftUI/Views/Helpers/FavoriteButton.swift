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
    //구속된다.
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
