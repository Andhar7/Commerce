//
//  SideMenu.swift
//  Commerce
//
//  Created by Andrej Kling on 10.01.21.
//

import SwiftUI

struct SideMenu: View {
    
    @State var show = false
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView(.vertical,showsIndicators: false) {
                    VStack(spacing: 15.0) {
                        ForEach(1...10, id:\.self){ i in
                            Image("a\(i)")
                                .resizable()
                                .frame(height: 250)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.orange, lineWidth: 5))
                        }
                    }
                    .padding()
                }
                
                GeometryReader {_ in
                    HStack {
                        Menu()
                            .offset(x: self.show ? 0 : -UIScreen.main.bounds.width)
                            .animation(.linear)
                        
                        Spacer()
                    }
                }
                .background(Color.black.opacity(self.show ? 0.3 : 0)
                                .edgesIgnoringSafeArea(.bottom))
                .blur(radius: self.show ? 0.2 : 0)
               
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.show.toggle()
                                    }) {
                                        
                                        if self.show{
                                            Image(systemName: "arrow.left")
                                                .font(.body)
                                                .foregroundColor(.black)
                                        }else {
                                            
                                            Image("SwiftUI")
                                                .renderingMode(.original)
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .clipShape(Circle())
                                                .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                                        }
                                        
                                        
                                    }
            )
        }
        
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

struct  Menu: View {
    
  //  @Binding var show : Bool
    
    var body: some View{
        
        VStack(spacing: 25){
            Button(action: {
                
            }){
                VStack(spacing: 8) {
                    Image("a10")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                    Text("SwiftUI")
                }
            }
            Button(action: {
                
            }){
                VStack(spacing: 8) {
                    Image("a3")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                    Text("Commerce")
                }
            }
            Button(action: {
                
            }){
                VStack(spacing: 8) {
                    Image("a6")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                    Text("Video")
                }
            }
            Button(action: {
                
            }){
                VStack(spacing: 8) {
                    Image("a7")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                    Text("E-mail")
                }
            }
            Button(action: {
                
            }){
                VStack(spacing: 8) {
                    Image("a2")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                    Text("iMac")
                }
            }
            Button(action: {
                
            }){
                VStack(spacing: 8) {
                    Image("a4")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.orange, lineWidth: 2))
                    Text("XCode")
                }
            }
            Spacer(minLength: 15)
        }
        .padding(35)
        .foregroundColor(.black)
        .background(Color("p1"))
        .edgesIgnoringSafeArea(.bottom)
    }
}
