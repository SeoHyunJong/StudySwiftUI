//
//  Profile.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/15.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    //예약어를 변수로 사용하기 위해 ` 로 감싸주었다.
    
    enum Season: String, CaseIterable, Identifiable { //CaseIterable을 채택해야 후에 ForEach로 모든 열거형 표현 가능
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        var id: String {rawValue}
    }
}
