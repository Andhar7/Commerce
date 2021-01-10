//
//  CardView.swift
//  Commerce
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var model : ItemViewModel
    var item : Item
    var animation : Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 0)
                Text(item.price)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(12)
            }
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(item.id)", in: animation)
                .padding(.top ,31)
                .padding(.bottom)
                .padding(.horizontal, 12)
            Text(item.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                
            Text(item.subTitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                
            
            // Using Match Geometry Effect for Hero Animation...
            
            HStack {
                Button(action: {}){
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                }
                .matchedGeometryEffect(id: "heart\(item.id)", in: animation)
                Spacer(minLength: 0)
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(item.id)", in: animation)
            }
            .padding()
        }
        // giving hero effect for color also...
        .background(
            Color(item.image)
                .matchedGeometryEffect(id: "color\(item.id)", in: animation)
        )
        .cornerRadius(15)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
