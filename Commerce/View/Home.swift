//
//  Home.swift
//  Commerce
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var model : ItemViewModel
    @State var selectedItem : Item = items[0]
    @State var selected = tabs[0]
    @State var show = false
    @Namespace var animation
    
    var body: some View {
        ZStack{
            VStack {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 33, weight: .regular, design: .serif))
                            .foregroundColor(.black)
                    })
                    Spacer(minLength: 0)
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 33, height: 33)
                        .clipShape(Circle())
                }
                .padding(.vertical,12)
                .padding(.horizontal)
                Spacer(minLength: 0)
                
                ScrollView{
                    VStack{
                        HStack {
                            VStack(alignment: .leading, spacing: 5.0){
                                Text("Let´s")
                                    .font(.title)
                                Text("Get Started")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            Spacer(minLength: 0)
                        }
                        
                        HStack(spacing: 0){
                            ForEach(model.tabs, id:\.self){ tab in
                                
                                TabButton(model: _model, title: tab, selectedItem: $selected, animation: animation)
                                // even spacing ...
                                if selected != tab{Spacer(minLength: 0)}
                            }
                        }
                        .padding()
                        .padding(.top,5)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 21), count: 2), spacing: 25) {
                            
                            ForEach(model.items){ item in
                                CardView(item: item, animation: animation)
                                    .onTapGesture {
                                        
                                        withAnimation(.spring()){
                                            
                                            selectedItem = item
                                            show.toggle()
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                Spacer(minLength: 0)
                
               
            }
            .opacity(show ? 0 : 1)
            
            
            if show {
                DetailView(model: _model, selectedItem: $selectedItem, show: $show, animation: animation)
            }
        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(ItemViewModel())
    }
}
