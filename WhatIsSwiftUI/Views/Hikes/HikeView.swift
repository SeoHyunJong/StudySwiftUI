/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    //제공된 애니메이션에 의해 재연산된 뷰바디를 return
                    //이걸 써주니까 화살표가 갑자기 돌아간다...?
                    //그리고 HikeDetail이 자연스럽게 잘 나온다.
                    //급 개념혼동. 클로저에 대한 이해가 필요. in은 무엇인가?
                    //어째서 VStack이라는 구조체 내에서 여러 구조체들을 스택처럼 넣을 수 있는가?
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
