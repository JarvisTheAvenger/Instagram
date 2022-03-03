//
//  ReelsView.swift
//  Instagram
//
//  Created by Rahul on 03/03/22.
//

import SwiftUI

struct ReelsView: View {
    var body: some View {
        List(1..<10) {
            Text("\($0)")
        }
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        ReelsView()
    }
}
