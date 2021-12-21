//
//  PhotoView.swift
//  Album
//
//  Created by lollipop on 2021/12/21.
//

import SwiftUI

struct PhotoView: View {
    var labelAndImgPair:[String: [UIImage]]
    var allImgs: [UIImage] {
        return Array(labelAndImgPair.map { $0.value}.joined())
        
    }
    var body: some View {
        TabView{
//            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()], spacing: 0) {
//                ForEach(allImgs, id: \.self) {
//                    img in
//                    Image(uiImage: img)
//                }
//
//            }
            AllPhoto(isShowDetail: Array.init(repeating: false, count: allImgs.count),allImgs: allImgs)
            .tabItem {
                Image(systemName: "photo")
                Text("图片")
            }
            
            
            NavigationView{
                List(Array(labelAndImgPair.keys), id: \.self){ label in
                    NavigationLink(label, destination: AllPhoto(isShowDetail: Array.init(repeating: false, count: labelAndImgPair[label]!.count),allImgs: labelAndImgPair[label]!))
                    
                }.navigationTitle("分类")
                    .listStyle(InsetListStyle())
            }.tabItem {
                Image(systemName: "table")
                Text("分类")
            }
        }

    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(labelAndImgPair: [:])
    }
}
