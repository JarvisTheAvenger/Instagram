//
//  ContentView.swift
//  Instagram
//
//  Created by Rahul on 03/03/22.
//

import SwiftUI

enum TabItems: String {
    case home = "house.fill"
    case search = "magnifyingglass"
    case reels = "Reels"
    case favorites = "suit.heart"
    case profile = "person.circle"
}

struct TabbarView: View {
    @State private var currentTab = TabItems.reels.rawValue
    
    let tabs = [TabItems.home.rawValue, TabItems.search.rawValue,
                TabItems.reels.rawValue, TabItems.favorites.rawValue, TabItems.profile.rawValue]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                HomeView()
                    .tag(TabItems.home.rawValue)
                
                SearchView()
                    .tag(TabItems.search.rawValue)
                
                ReelsView()
                    .tag(TabItems.reels.rawValue)
                
                FavoritesView()
                    .tag(TabItems.favorites.rawValue)
                
                ProfileView()
                    .tag(TabItems.profile.rawValue)
            }
            
        }
        
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { image in
              TabbarButton(image: image, isSystemImage: image != "Reels", currentTab: $currentTab)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}


struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

