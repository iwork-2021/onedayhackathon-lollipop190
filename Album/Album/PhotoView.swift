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
            AllPhoto(allImgs: allImgs)
            .tabItem {
                Image(systemName: "rectangle.fill")
                Text("所有照片")
            }
            
            
            NavigationView{
                List(Array(labelAndImgPair.keys), id: \.self){ label in
                    NavigationLink(label, destination: AllPhoto(allImgs: labelAndImgPair[label]!))
                    
                }
            }.tabItem {
                Image(systemName: "rectangle.fill")
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
