//
//  Hike.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/14.
//

import Foundation
import SwiftUI

struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    static var formatter = LengthFormatter() //길이나 높이 측정을 도와주는 클래스
    
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
