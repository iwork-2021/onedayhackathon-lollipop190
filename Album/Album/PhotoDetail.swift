//
//  PhotoDetail.swift
//  Album
//
//  Created by lollipop on 2021/12/21.
//

import SwiftUI

struct PhotoDetail: View {
    var img: UIImage
    var body: some View {
            Spacer()
            Image(uiImage: img)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 8))
                .shadow(radius: 4)
                .frame(width: 400,height:400)
                .clipped()

            
        Spacer()
        
    }
}

//struct PhotoDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoDetail(img: nil)
//    }
//}
