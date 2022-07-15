//
//  ModelData.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/12.
//

import Foundation
import Combine
//Combine framework: 시간이 지남에 따라 값이 변화하는 오브젝트들을 비동기적으로 처리하기 위해 애플이 만든 프레임워크

final class ModelData: ObservableObject { //final: subclass가 오버라이드하는 것을 방지. 얘같은 경우엔 얘를 가지고 상속이 불가능함.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json") //값을 변경하지 않기 때문에 @Published 가 붙지 않는다.
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    //category 원시값에 의해 그룹핑이 된다.
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue})
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) //번들 리소스에서 파일 가져오기
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file) // A byte buffer in memory
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
