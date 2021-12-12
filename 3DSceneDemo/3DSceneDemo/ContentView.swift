//
//  ContentView.swift
//  3DSceneDemo
//
//  Created by 李易潤 on 2021/12/10.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}


struct Home: View {
    
    @State var models = [
        Model(id: 0, name: "水星", modelName: "Mercury.usdz", details: "在古羅馬神話中水星是商業、旅行和偷竊之神，即古希臘神話中的赫耳墨斯，為眾神傳信的神，或許由於水星在空中移動得快，才使它得到這個名字。"
        ),
        Model(id: 0, name: "金星", modelName: "Venus.usdz", details: "是離太陽第二近的行星，太陽系中第六大行星。在所有行星中，金星的軌道最接近圓，偏差不到1%。"
        ),
        Model(id: 0, name: "地球", modelName: "Earth.usdz", details: "我們的家園，是太陽系從內向外第三顆行星，也是太陽系第五大行星。"
        ),
        Model(id: 0, name: "月球", modelName: "Moon.usdz", details: "月球，即地衛一，通稱月亮或月，古稱太陰、玄兔、嬋娟、望舒等，是地球唯一的天然衛星，並且是太陽系中第五大的衛星。月球的直徑略大於地球的四分之一，質量約為地球的1/81，相對於所環繞的行星，它是體積和質量最大的衛星，也是太陽系內密度第二高的衛星，僅次於木衛一。"
        ),
        Model(id: 0, name: "火星", modelName: "Mars.usdz", details: "為距太陽第四遠，也是太陽系中第七大行星，在中國古代又稱熒火，因為火星呈紅色，熒熒像火，亮度常有變化；而且在天空中運動，有時從西向東，有時又從東向西，情況複雜，令人迷惑，所以中國古代叫它“熒惑”，有“熒熒火光，離離亂惑。”之意。"
        ),
        Model(id: 0, name: "木星", modelName: "Jupiter.usdz", details: "是離太陽第五顆行星，而且是最大的一顆，比所有其他的行星的和質量大2.5倍（地球的318倍）。"
        ),
        Model(id: 0, name: "土星", modelName: "Saturn.usdz", details: "是離太陽第六遠的行星，也是八大行星中第二大的行星。"
        ),
        Model(id: 0, name: "天王星", modelName: "Uranus.usdz", details: "是太陽系中離太陽第七遠行星，從直徑來看，是太陽系中第三大行星。天王星的體積比海王星大，質量卻比其小。"
        ),
        Model(id: 0, name: "海王星", modelName: "Neptune.usdz", details: "是環繞太陽運行的第八顆行星，也是太陽系中第四大天體（直徑上）。海王星在直徑上小於天王星，但質量比它大。"
        )
    ]
    
    @State var index = 0
    
    var body: some View {
        
        VStack {
            // 使用SceneKit建立View
            SceneView(
                scene: {
                    let scene = SCNScene(named: models[index].modelName)!
                    scene.background.contents = UIColor.black
                    return scene
                }(),
                options: [.autoenablesDefaultLighting, .allowsCameraControl])
                // 設定frame寬高
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            
            ZStack {
                // 前一頁、下一頁按鈕
                HStack {
                    Button(action: {
                        
                        withAnimation {
                            if index > 0 {
                                index -= 1
                            }
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.system(size: 35, weight: .bold))
                            // 透明度
                            .opacity(index == 0 ? 0.3 : 1)
                    })
                    // 判斷是否可以點擊
                    .disabled(index == 0 ? true : false)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation {
                            if index < models.count {
                                index += 1
                            }
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 35, weight: .bold))
                            // 透明度
                            .opacity(index == models.count - 1 ? 0.3 : 1)
                    })
                    // 判斷是否可以點擊
                    .disabled(index == models.count - 1 ? true : false)
                }
                
                Text(models[index].name)
                    .font(.system(size: 45, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(.horizontal, 40)
            .padding(.vertical, 30)
            
            // 簡介
            VStack(alignment: .leading, spacing: 10, content: {
                Text("簡介")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(models[index].details)
            })
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Model: Identifiable {
    
    var id: Int
    var name: String
    var modelName: String
    var details: String
}
