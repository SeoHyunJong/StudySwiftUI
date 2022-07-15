//
//  ProfileHost.swift
//  WhatIsSwiftUI
//
//  Created by 서현종 on 2022/07/15.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode //뷰 환경에서 변수를 읽어오는게 가능해진다.
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
                //SwiftUI에 내장된 함수로 버튼을 누르면 자동으로 edit mode 환경 변수를 자동으로 토글한다.
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
