//
//  ContentView.swift
//  Instagram
//
//  Created by Rahul on 03/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }.tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            ReelsView()
                .tabItem {
                    Image(systemName: "video.circle")
                }.tag(2)
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }.tag(4)
            
        }
        .accentColor(.white)
        .onAppear() {
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().barTintColor = .white
            UITabBar.appearance().backgroundColor = .black

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
