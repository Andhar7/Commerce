//
//  CheckingImage.swift
//  Commerce
//
//  Created by Andrej Kling on 10.01.21.
//

import SwiftUI

struct CheckingImage: View {
    @State var function : Image
    fileprivate func SwiftUICircle(for Photo:Image) -> some View {
        return Photo // Image("SwiftUI")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.orange, lineWidth: 5))
            .shadow(color: .orange, radius: 15, x: 0, y: 0)
    }
    
    var body: some View {
        SwiftUICircle(for: function)
    }
}

struct CheckingImage_Previews: PreviewProvider {
    static var previews: some View {
        CheckingImage(function: Image("SwiftUI"))
    }
}
