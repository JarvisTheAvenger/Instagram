//
//  Reel.swift
//  Instagram
//
//  Created by Rahul on 30/03/22.
//

import Foundation
import AVKit

struct Reel: Identifiable {
    var id: String = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile?
    
}
