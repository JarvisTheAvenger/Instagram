//
//  ReelsView.swift
//  Instagram
//
//  Created by Rahul on 03/03/22.
//

import SwiftUI

struct ReelsView: View {
    var body: some View {
        List(1..<4) { idx in
            let videoUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "\(idx)", ofType: "mp4")!)
            ReelsCellView(videoURL: videoUrl)
        }
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        ReelsView()
    }
}
