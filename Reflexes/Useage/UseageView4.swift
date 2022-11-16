//
//  Useage4.swift
//  Reflexes
//
//  Created by 間口秀人 on 2022/09/10.
//

import SwiftUI

struct UseageView4: View {
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        VStack {
            Text("クリアタイムによってランクが上がる")
                .font(.custom("g_squarebold-free", size: 20))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding()
            Text("Sランク... 0.00 ~ 0.30秒\nAランク... 0.31 ~ 0.50秒\nBランク... 0.51 ~ 1.00秒\nCランク... 1.00秒~")
            Image("Useage4")
                .resizable()
                .frame(width: width * 4/5, height: height/2)
                .padding()
            Spacer()
        }
    }
}

struct Useage4_Previews: PreviewProvider {
    static var previews: some View {
        UseageView4()
    }
}
