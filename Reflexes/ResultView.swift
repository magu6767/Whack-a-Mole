//
//  ResultView.swift
//  Reflexes
//
//  Created by 間口秀人 on 2022/09/04.
//

import SwiftUI

struct ResultView: View {
    @Binding var resultReflexes: String
    @Binding var resultTime: Double
    var body: some View {
        ZStack {
            if resultReflexes == "Clear!"{
                Image("\(judgementBackground(resultTime: resultTime))")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }else{
                Image("RankC")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            VStack {
                Text(resultReflexes)
                    .font(.custom("g_squarebold-free", size: 50))
                    .padding()
                if resultReflexes == "Clear!"{
                    VStack{
                        Text("記録：\(String(format: "%.2f", resultTime))秒")
                            .font(.title)
                            .padding()
                        Text("Rank")
                            .font(.custom("g_squarebold-free", size: 40))
                            .foregroundColor(.black)
                        Text("\(judgementRank(resultTime: resultTime))")
                            .foregroundColor(judgementColor(resultTime: resultTime))
                            .font(.custom("g_squarebold-free", size: 100))
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    //共有ボタン
                    Button(action: {
                        shareApp(shareText: "私のモグラたたきの記録は\(String(format: "%.2f", resultTime))秒でした！", shareImage: Image("icon"), shareLink: "https://apps.apple.com/jp/app/%E3%83%A2%E3%82%B0%E3%83%A9%E3%81%9F%E3%81%9F%E3%81%8D%E3%82%B2%E3%83%BC%E3%83%A0/id1643489594")
                    }) {
                        HStack{
                            Image(systemName: "square.and.arrow.up")
                                .frame(width: 30)
                                .foregroundColor(.white)
                            Text("シェアする")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                }
                NavigationLink(destination: GameSceneView(), label: {
                    Text("もう一度遊ぶ")
                        .foregroundColor(.blue)
                        .font(.custom("g_squarebold-free", size: 20))
                        .padding()

                    
                })
                Spacer()
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    func judgementRank(resultTime: Double) -> String {
        switch resultTime {
        case 0.00..<0.30:
            return String("S")
        case 0.30..<0.50:
            return String("A")
        case 0.50..<1.00:
            return String("B")
        default:
            return String("C")
        }
    }
    
    func judgementBackground(resultTime: Double) -> String {
        switch resultTime {
        case 0.00..<0.30:
            return String("RankS")
        case 0.30..<0.50:
            return String("RankA")
        case 0.50..<1.00:
            return String("RankB")
        default:
            return String("RankC")
        }
    }
    
    func judgementColor(resultTime: Double) -> Color {
        switch resultTime {
        case 0.00..<0.30:
            return Color.orange
        case 0.30..<0.50:
            return Color.red
        case 0.50..<1.00:
            return Color.blue
        default:
            return Color.green
        }
    }
    
    // シェアボタン
   func shareApp(shareText: String, shareImage: Image, shareLink: String) {
       let items = [shareText, shareImage, URL(string: shareLink)!] as [Any]
       let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
       let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
       let rootVC = windowScene?.windows.first?.rootViewController
       rootVC?.present(activityVC, animated: true,completion: {})
   }
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(resultReflexes: Binding.constant("Clear!"), resultTime: Binding.constant(0.30))
    }
}
