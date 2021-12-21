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
       Image(uiImage: img)
    }
}

//struct PhotoDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoDetail(img: nil)
//    }
//}
