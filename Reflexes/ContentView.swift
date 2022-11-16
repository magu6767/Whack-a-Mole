//
//  ContentView.swift
//  Reflexes
//
//  Created by 間口秀人 on 2022/08/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        ZStack {
            Color.green
                .ignoresSafeArea()
            Image("bg_pattern1_aozora")
                .resizable()
                .frame(width: width, height: height/3)
                .position(x: width/2, y: 0)

            VStack {
                Text("モグラたたきゲーム")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                    .font(.custom("g_squarebold-free", size: 30))
                

                NavigationLink(destination: GameSceneView()){
                    Text("スタート")
                        .padding()
                        .foregroundColor(.blue)
                        .font(.custom("g_squarebold-free", size: 20))
                }
                NavigationLink(destination: UseageView()){
                    Text("使い方")
                        .foregroundColor(Color.white)
                        .font(.custom("g_squarebold-free", size: 20))
                        .padding(.top,30)
                }
                Image("Mole")
                    .padding(.top,30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
