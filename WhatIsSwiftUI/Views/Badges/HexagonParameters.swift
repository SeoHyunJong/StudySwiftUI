//
//  HexagonParameters.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/14.
//

import CoreGraphics
//lightweight 2D 렌더링을 하이파이 출력으로 구현하는 발전된 Quartz 기술(뭔 소리야 이게...?)
//경로 기반 그리기 동작과 안티얼라이싱, 그래디언트, 이미지, 색상 관리, PDF 문서 등을 처리할 수 있다.
struct HexagonParameters {
    struct Segment {
        let line: CGPoint //CoreGraphics 프레임워크에 정의되어 있는 구조체 타입. 2차원 공간 좌표이다.
        let curve: CGPoint
        let control: CGPoint
    } //참고 이 구조체의 프로퍼티의 의미
    //1. line: 시작점에서 첫번째 포인트까지 직선을 그린다.
    //2. curve: 첫번째 포인트에서 두번째 포인트까지는 베지어 곡선을 그린다.
    //3. control: 세번째 포인트는 이 베지어 곡선의 곡률을 정한다.
    
    static let adjustment: CGFloat = 0.085 //육각형 모양을 튜닝하기 위해 생성
    
    static let segments = [ //육각형의 각 꼭짓점들...
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
