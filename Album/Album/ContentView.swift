//
//  ContentView.swift
//  Album
//
//  Created by lollipop on 2021/12/21.
//

import SwiftUI

struct ContentView: View {
    private let classifier = ImageClassifier()
    @State private var label: String = "explore your photo!"
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var isShowAllImage = false
    @State public var labelImgPair : [String: [UIImage]] = [:]
    
    var body: some View {
        NavigationView {
            VStack {
                
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 8))
                        .shadow(radius: 4)
                        .frame(width: 400,height:400)
                        .clipped()
                } else {
                    Image(systemName: "plus.magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200,height: 300)
                        
                }
                
                Text(label).font(.largeTitle).fontWeight(.bold)
                
                Spacer()
                HStack{
                    Button(action: {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }){
                    Image(systemName: "camera.fill") .padding().foregroundColor(.blue).font(.largeTitle)
                    }
                    
                    Button(action: {
                        self.isShowAllImage.toggle()
                    }){
                        Image(systemName: "heart.fill").padding().foregroundColor(.blue).font(.largeTitle)
                    }
                    Button(action: {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }){
                        Image(systemName: "photo").padding().foregroundColor(.blue).font(.largeTitle)
                    }
                }.buttonStyle(GrowingButton())
              
           
            }
            .navigationBarTitle("Album")
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType, label: self.$label, labelImgPair: self.$labelImgPair)
            }
            .sheet(isPresented: self.$isShowAllImage){
                PhotoView(labelAndImgPair: labelImgPair)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
