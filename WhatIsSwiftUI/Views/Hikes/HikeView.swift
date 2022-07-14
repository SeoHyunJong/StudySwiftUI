/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

//이렇게 transition을 따로 관리하면 커스텀 트랜지션을 만들때 코드 관리가 깔끔해진다.
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        ) //뷰가 나타나고 사라질때 나오는 트랜지션을 비동기적으로 구현할 수 있다.
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true

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
                    //이걸 써주니까 화살표가 돌아가고 커지는 애니메이션이 재생된다.
                    //그리고 HikeDetail이 자연스럽게 잘 나온다.
                    //찾아보니까 해당 액션과 관련된 뷰들의 애니메이션을 재생해준다.
                    //default 애니메이션이 존재한다.
                    withAnimation(){
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
                    .transition(.moveAndFade)
                //transition이랑 animation이랑 무슨 차이지...?
                //ppt 애니메이션 효과와 비슷하게 생각해보자.
                //transition은 화면(뷰) 전환할때 일어나는 액션이고
                //애니메이션은 뷰가 이미 존재해도 기능을 수행한다.
                //즉 transition은 뷰가 나오거나 사라질 때만 수행.
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
