//
//  ContentView.swift
//  Commerce
//
//  Created by Andrej Kling on 09.01.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var homeModel = ItemViewModel()
    @State private var selection : Tab = .commerce
    
    enum Tab {
        case commerce
        case list
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            Home()
                .environmentObject(homeModel)
                .tabItem {
                    Label("Commerce", systemImage: "star")
                }
                .tag(Tab.commerce)
            
            SideMenu()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
