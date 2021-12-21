//
//  ImagePickerView.swift
//  Album
//
//  Created by lollipop on 2021/12/21.
//


import UIKit
import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    public let classifier = ImageClassifier()
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
        
    
    @Binding var label: String
    @Binding var labelImgPair : [String: [UIImage]]
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator // confirming the delegate
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }
    
    // Connecting the Coordinator class with this struct
        func makeCoordinator() -> Coordinator {
            return Coordinator(picker: self)
        }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePickerView
    
    init(picker: ImagePickerView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
        self.picker.classifier.classify(image: selectedImage)
        self.picker.label = self.picker.classifier.label
        if let _ = self.picker.labelImgPair[self.picker.label] {
            self.picker.labelImgPair[self.picker.label]?.append(selectedImage)
        }else {
            self.picker.labelImgPair[self.picker.label] = [selectedImage]
        }
        
//        print(self.picker.labelImgPair)
    }
    
}



