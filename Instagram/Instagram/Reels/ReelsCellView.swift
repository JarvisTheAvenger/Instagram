//
//  ReelsCellView.swift
//  Instagram
//
//  Created by Rahul on 29/03/22.
//

import AVKit
import SwiftUI

struct ReelsCellView: View {
    let videoURL: URL

    var body: some View {
        VideoPlayer(player: AVPlayer(url: videoURL))
            .frame(height: 320)
    }
}
