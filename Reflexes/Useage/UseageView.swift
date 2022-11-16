//
//  UseageView.swift
//  Reflexes
//
//  Created by 間口秀人 on 2022/08/27.
//

import SwiftUI

struct UseageView: View {
    @State var selectedTag = 1
    var body: some View {
        TabView(selection: $selectedTag) {
            UseageView2()
                .tag(1)
            UseageView3()
                .tag(2)
            UseageView4()
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
    }
}

struct UseageView_Previews: PreviewProvider {
    static var previews: some View {
        UseageView()
    }
}
