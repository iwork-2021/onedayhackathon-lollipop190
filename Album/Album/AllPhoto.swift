//
//  AllPhoto.swift
//  Album
//
//  Created by lollipop on 2021/12/21.
//

import SwiftUI

struct AllPhoto: View {
    @State var isShowDetail = false
    var allImgs: [UIImage]
    var body: some View {
        GeometryReader{
            geo in
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())], spacing: 3){
                    ForEach(allImgs, id: \.self) {
                                    img in
                        Image(uiImage: img)
                            .resizable().frame(width: geo.size.width / 3, height: geo.size.height / 3).onTapGesture {
                                self.isShowDetail.toggle()
                            }.sheet(isPresented: self.$isShowDetail){
                                PhotoDetail(img: img)
                            }
                    }
                }
            }
        }
    }
}

//struct AllPhoto_Previews: PreviewProvider {
//    static var previews: some View {
//        AllPhoto(u)
//    }
//}
