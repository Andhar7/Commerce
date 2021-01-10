//
//  DetailView.swift
//  Commerce
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var model : ItemViewModel
    @Binding var selectedItem : Item
    @Binding var show : Bool
    var animation : Namespace.ID
    @State var loadContent = false
    @State var selectedColor : Color = Color("p1")
    
    var body: some View {
        // Optimization for smaller size iPhone.....
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), content:  {
            VStack{
                
                HStack(spacing: 25){
                    
                    Button(action: {
                        // closing view...
                        withAnimation(.spring()){show.toggle()}
                    }) {
                        
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {}) {
                        
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                VStack(spacing: 10) {
                    Image(selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .padding()
                    Text(selectedItem.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Text(selectedItem.subTitle)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    HStack{
                        
                        Text(selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                        Spacer()
                        Button(action: {}){
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                        }
                        .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
     
                    }
                    .padding()
                }
                .padding(.top, 33)
                .background(
                    Color(selectedItem.image)
                        .clipShape(CustomShape())
                        .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
                )
                .cornerRadius(15)
                .padding()
                
                // delay loading the content for smooth animation...
                VStack {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Exclusive Offer")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text("Frame + Lens for $35 (it´s 50% off)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 31, alignment: .leading)
                    .background(Color(selectedItem.image))
                    .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text("Color")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        HStack(spacing: 15.0) {
                            ForEach(1...4, id:\.self){ i in
                                ZStack{
                                    Color("p\(i)")
                                        .clipShape(Circle())
                                        .frame(width: 45, height: 45)
                                        .onTapGesture {
                                            withAnimation{
                                                selectedColor = Color("p\(i)")
                                            }
                                        }
                                    // checkmark for selected one..
                                    if selectedColor == Color("p\(i)"){
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            Spacer(minLength: 0)
                        }
                    }
                    .padding()
                    
                    Spacer(minLength: 15)
                    
                    Button(action: {}) {
                        Text("Try Frame in 3D")
                             .font(.system(size: 18, weight: .regular, design: .serif))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.white)
                                   // .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color(.black).opacity(0.5), radius: 5, x: 0, y: 0)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        Text("Add to Cart")
                             .font(.system(size: 18, weight: .regular, design: .serif))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.black)
                                   // .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    .background(Color.black)
                    .cornerRadius(15)
                    .padding(.vertical)
                    .shadow(color: Color(.black).opacity(0.5), radius: 5, x: 0, y: 0)
                    
                }
                .padding([.horizontal, .bottom])
                .frame(height: loadContent ? nil : 0)
                .opacity(loadContent ? 1 : 0)
                // for smooth transition...
                Spacer(minLength: 0)
            }
        })// ScrollView
            .onAppear{
                withAnimation(Animation.spring().delay(0.45)){
                    loadContent.toggle()
                }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
     
    static var previews: some View {
        ContentView()
    }
}
