//
//  CustomVideoPlayer.swift
//  Instagram
//
//  Created by Rahul on 30/03/22.
//

import SwiftUI
import AVFoundation
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> some UIViewController {
      
        let vc = AVPlayerViewController()
        vc.player = player
        vc.showsPlaybackControls = false
        vc.videoGravity = .resizeAspectFill
        vc.player?.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.restartPlayback), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
    class Coordinator: NSObject {
        var parent: CustomVideoPlayer
        
        init(parent: CustomVideoPlayer) {
            self.parent = parent
        }
        
        @objc func restartPlayback() {
            parent.player.seek(to: .zero)
        }
    }

    
}

