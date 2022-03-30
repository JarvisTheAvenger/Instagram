//
//  TabbarButton.swift
//  Instagram
//
//  Created by Rahul on 30/03/22.
//

import SwiftUI

struct TabbarButton: View {
    var image: String
    var isSystemImage: Bool
    
    @Binding var currentTab: String
    
    var body: some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            ZStack {
                if isSystemImage {
                    Image(systemName: image)
                        .font(.title2)
                } else {
                    Image(image)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                }
            }
            .foregroundColor(currentTab == image ? .primary : .gray)
            .frame(maxWidth: .infinity)
            
        }
        
    }
}
