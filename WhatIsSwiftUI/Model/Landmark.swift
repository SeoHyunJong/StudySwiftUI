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
