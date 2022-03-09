//
//  ContentView.swift
//  Instagram
//
//  Created by Rahul on 03/03/22.
//

import SwiftUI

enum TabItems: Int {
    case home, search, reels, favorites, profile
}

struct ContentView: View {
    @State private var selectedTab = TabItems.reels.rawValue
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }.tag(TabItems.home.rawValue)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(TabItems.search.rawValue)
            
            ReelsView()
                .tabItem {
                    Image(systemName: "video.circle")
                }.tag(TabItems.reels.rawValue)
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                }.tag(TabItems.favorites.rawValue)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }.tag(TabItems.profile.rawValue)
            
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
