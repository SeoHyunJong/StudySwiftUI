//
//  BadgeBackground.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/14.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        //Path: 2차원 도형의 윤곽선. 내가 이해하기로는... 개발자가 커스텀 도형을
        //그릴 수 있도록 제공하는 일종의 가상의 펜이다.
        //GeometryReager: 부모 레이아웃에 맞는 preferred size를 return한다.
        //따라서 size를 하드코딩하지 않고도 여러 기기에서 범용적으로 사용할 수 있게 한다.
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move( //Drawing Cursor 즉 가상의 펜촉을
                    //해당 위치로 옮겨 이 위치에서 그릴 준비를 하겠다는 뜻
                    to: CGPoint (
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(.linearGradient(
                //인스턴스 프로퍼티가 아닌 타입 프로퍼티를 쓰기 때문에 self가 아닌 Self를 쓴다.
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0/255, green: 120.0/255, blue: 221.0/255)
    static let gradientEnd = Color(red: 239.0/255, green: 172.0/255, blue: 120.0/255)
    
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
