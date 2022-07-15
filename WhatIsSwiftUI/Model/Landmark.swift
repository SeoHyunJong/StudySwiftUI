//
//  Landmark.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/12.
//

import Foundation
import SwiftUI
import CoreLocation // 사용자의 기기로부터 위치 정보를 얻는 프레임워크

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool // 추천
    
    var category: Category //json파일내에 있는 category가 rawValue와 매칭되어서 열거형 타입이 정해지나보다...
    //이게 가능한 이유.. Codable 프로토콜을 채택했기 때문이다.
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D { //CLLocation 표시를 위한 일종의 좌표
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
