//
//  UseageVIew2.swift
//  Reflexes
//
//  Created by 間口秀人 on 2022/09/10.
//

import SwiftUI

struct UseageView2: View {
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        VStack {
            Text("かくれているモグラをやっつけよう")
                .font(.custom("g_squarebold-free", size: 20))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding()
            Image("Useage2")
                .resizable()
                .frame(width: width * 4/5, height: height/2)
                .padding()
            Spacer()
        }
    }
}

struct UseageVIew2_Previews: PreviewProvider {
    static var previews: some View {
        UseageView2()
    }
}
