//
//  AllPhoto.swift
//  Album
//
//  Created by lollipop on 2021/12/21.
//

import SwiftUI

struct AllPhoto: View {
    @State var isShowDetail: [Bool]
    var allImgs: [UIImage]
    var body: some View {
        GeometryReader{
            geo in
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())], spacing: 10){
                    ForEach(0..<allImgs.count) {
                                    index in
                        Image(uiImage: allImgs[index])
                            .resizable().scaledToFill().frame(width: geo.size.width / 3, height: geo.size.height / 3, alignment: .topLeading).clipped().onTapGesture {
                                self.isShowDetail[index].toggle()
                            }.sheet(isPresented: self.$isShowDetail[index]){
                                PhotoDetail(img: allImgs[index])
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
