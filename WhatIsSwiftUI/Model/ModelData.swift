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
