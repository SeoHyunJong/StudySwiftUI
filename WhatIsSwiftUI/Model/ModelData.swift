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
} //ObservableObject: SwiftUI가 지속적으로 관찰하고 관리하는 객체. 만약 이 객체의 값이 변경되면 objectWillChange를 통해 사전에 알려줄수 있다.
//@Published는 프로퍼티 래퍼로 해당 타입에 Publisher를 만들어준다. 따라서 발행자가 된다는 것인데, 구독자는 $를 통해 접근할 수 있다.
//주의할 점은 이 프로퍼티 래퍼는 참조 타입인 클래스내에서만 사용 가능하다. 구조체안에서는 사용 불가
//Combine Framework에 대한 숙지가 필요

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
