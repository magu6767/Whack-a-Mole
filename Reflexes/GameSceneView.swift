//
//  GameSceneView.swift
//  Reflexes
//
//  Created by 間口秀人 on 2022/08/27.
//

import SwiftUI

import SwiftUI
struct GameSceneView : View {
    @State var count = 3
    @State var timer :Timer?
    @State private var flag = 0
    @State var text :String = "Start"
    @State var countText:String = ""
    let musicplayer = SoundPlayer()

    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        ZStack{
            Color.green
                .ignoresSafeArea()
            Image("bg_pattern1_aozora")
                .resizable()
                .frame(width: width, height: height/3)
                .position(x: width/2, y: 0)
            
            if flag == 0{
                VStack {
                    Text(countText)
                        .padding()
                        .font(.custom("g_squarebold-free", size: 50))
                    
                    Button(action: {
                        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            if self.count == 1{
                                musicplayer.musicPlayer2()
                                timer?.invalidate()
                                flag = 1
                            }else{
                                self.count -= 1
                                countText = String(count)
                            }
                        }
                        countText = String(count)
                        text = ""
                        
                    }) {
                        Text(text)
                            .font(.custom("g_squarebold-free", size: 50))
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
            }else if flag == 1{
                Text("")
                    .onAppear{
                        flag = 2
                    }
            }else{
                GamePlayView()
            }
        }
    }
    
    
}

struct Hole: Identifiable{
    var id = UUID()
    var image : Image
    var goAnimal: Bool = false
}

struct GamePlayView: View {
    @ObservedObject var value = startCounter()
    @State private var isActive = false
    @State var resultReflexes: String = ""
    @State var ImageList: [[Hole]] = [
        //それぞれの配列の要素数をずらすため空のImageを設定
        [Hole(image: Image("hole_ana")), Hole(image: Image("hole_ana")), Hole(image: Image("hole_ana"))],
        [Hole(image: Image("hole_ana")), Hole(image: Image("hole_ana")), Hole(image: Image("hole_ana")), Hole(image: Image(""))],
        [Hole(image: Image("hole_ana")), Hole(image: Image("hole_ana")), Hole(image: Image("hole_ana")), Hole(image: Image("")), Hole(image: Image(""))]
    ]
    let musicplayer = SoundPlayer()
    
    var body: some View {
        VStack{
            Text(resultReflexes)
                .font(.custom("g_squarebold-free", size: 50))
            NavigationLink(
                destination: ResultView(resultReflexes: $resultReflexes, resultTime: $value.reflexesValue),
                        isActive: $isActive,
                        label: {
                            EmptyView()
                        }
                    )
            ForEach(ImageList, id: \.endIndex){ items in
                HStack{
                    ForEach(items){ item in
                        if item.image != Image(""){
                                Button(action: {
                                    value.timer.invalidate()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        isActive = true
                                    }
                                    if item.goAnimal == true{
                                        musicplayer.musicPlayer()
                                        resultReflexes = "Clear!"
                                    }else{
                                        musicplayer.musicPlayer1()
                                        resultReflexes = "Failure"
                                    }
                                }) {
                                    randomAnimal(hole: item)
                                        .resizable()
                                        .scaledToFit()
                                    .padding(.top,30)                                                    }
                        }
                    }
                }
            }
            Text(String(format: "%.2f", value.reflexesValue))
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            ImageList[Int.random(in: 0...2)][Int.random(in: 0...2)].goAnimal = true
        }
        
      
    }
    
    func randomAnimal(hole: Hole) -> Image {
        if floor(value.timerValue*100)/100 == floor(value.startValue*100)/100 && hole.goAnimal == true{
            return Image("Mole")
        }else{
            return hole.image
        }
    }
    
}

struct GameSceneView_Previews: PreviewProvider {
    static var previews: some View {
        GameSceneView()
    }
}

