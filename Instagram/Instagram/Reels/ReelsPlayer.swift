//
//  ReelsCellView.swift
//  Instagram
//
//  Created by Rahul on 29/03/22.
//

import AVKit
import SwiftUI

struct ReelsPlayer: View {
    @Binding var reel: Reel
    
    @State var showMore = false
    
    let sampleText = "trees, flowers, plants, animals, sky, mountains, forests and more. Human beings depend on nature to stay alive. Nature helps us breathe, gives us food, water, shelter, medicines, and clothes. We find many colors in nature which make the Earth beautiful."
    
    @State var isMuted = false
    @State var volumeAnimation = false
    
    @Binding var currentReel: String
    
    var body: some View {
        
        ZStack {
            if let player = reel.player {
                CustomVideoPlayer(player: player)
                
                // Playing video based on the offset
                
                GeometryReader { proxy -> Color in
                    
                    let minY = proxy.frame(in: .global).minY
                    let size = proxy.size
                    
                    DispatchQueue.main.async {
                        // Since we have multiple cards and offset goes beyond
                        // so it starts playing below videos to avoid this
                        // checking current reel with reel id
                        
                        if -minY < (size.height / 2) && minY < (size.height / 2) && currentReel == reel.id {
                            player.play()
                        } else {
                            player.pause()
                        }
                        
                    }
                    
                    return Color.clear
                }
                
                Color.black
                    .frame(width: 150, height: 120, alignment: .bottom)
                    .opacity(0.01)
                    .onTapGesture {
                        if volumeAnimation {
                            return
                        }
                        
                        isMuted.toggle()
                        
                        // Muting player
                        player.isMuted = isMuted
                        
                        withAnimation { volumeAnimation.toggle() }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation { volumeAnimation.toggle() }
                        }
                    }
                
                Color.black.opacity(showMore ? 0.25 : 0)
                    .onTapGesture {
                        withAnimation {
                            showMore.toggle()
                        }
                    }
                
                VStack {
                    HStack(alignment: .bottom) {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(spacing: 15) {
                                Image("profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                
                                Text("Rahul")
                                    .font(.callout.bold())
                                
                                Button {
                                    
                                } label: {
                                    Text("Follow")
                                        .font(.callout.bold())
                                }
                            }
                            
                            ZStack {
                                if showMore {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        let text = reel.mediaFile?.title ?? "" + sampleText
                                        Text(text)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                            .lineLimit(100)
                                    }
                                    .frame(height: 120)
                                    .onTapGesture {
                                        withAnimation {
                                            showMore.toggle()
                                        }
                                    }
                                    
                                } else {
                                    Button {
                                        withAnimation { showMore.toggle() }
                                    } label: {
                                        HStack {
                                            Text(reel.mediaFile?.title ?? "")
                                                .font(.callout)
                                                .fontWeight(.semibold)
                                                .lineLimit(1)
                                            
                                            Text("more")
                                                .font(.callout.bold())
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.top, 6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                
                            }
                        }
                        
                        Spacer(minLength: 20)
                        
                        ActionButton(reel: reel)
                    }
                    
                    HStack {
                        Text("A sky full of dreams!")
                            .font(.caption)
                            .fontWeight(.semibold)
                            
                        Spacer(minLength: 20)
                        
                        Image("album")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 28, height: 28)
                            .cornerRadius(6)
                            .background(
                                
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.white, lineWidth: 3)
                            )
                            .offset(x: -5)
                    }
                    .padding(.top, 10)
                }
                .foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.weave.2.fill")
                    .font(.title)
                    .foregroundColor(.secondary)
                    .padding()
                    .background(.secondary)
                    .clipShape(Circle())
                    .foregroundStyle(.black)
                    .opacity(volumeAnimation ? 1 : 0)
            }
            
        }
        
    }
}

struct ActionButton: View {
    var reel: Reel
    
    var body: some View {
        VStack(spacing: 25) {
            
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "suit.heart")
                        .font(.title)
                    
                    Text("100k")
                        .font(.caption.bold())
                    
                }
            }
            
            
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "bubble.right")
                        .font(.title)
                    
                    Text("120")
                        .font(.caption.bold())
                    
                }
            }
            
            
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image(systemName: "paperplane")
                        .font(.title)
                }
            }
            
            Button {
                
            } label: {
                VStack(spacing: 10) {
                    Image("menu")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .rotationEffect(Angle(degrees: 90))
                }
            }
        }
    }
}
