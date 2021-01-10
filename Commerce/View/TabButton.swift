//
//  TabButton.swift
//  Commerce
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct TabButton: View {
    
    @EnvironmentObject var model : ItemViewModel
    var title : String
    @Binding var selectedItem : String
    var animation : Namespace.ID
    
    var body: some View {
        
        Button(action: {
            withAnimation(.spring()){
                selectedItem = title
            }
        }, label: {
            Text(title)
                .font(.system(size: 15, weight: .regular, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(selectedItem == title ? .white : .black)
                .padding(.vertical, 5)
                .padding(.horizontal, selectedItem == title ? 15 : 0)
                .background(
                // For Slide Effect Animation....
                    ZStack{
                        if selectedItem == title {
                            Color.orange
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
