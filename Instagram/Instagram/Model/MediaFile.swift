//
//  MediaFile.swift
//  Instagram
//
//  Created by Rahul on 30/03/22.
//

import Foundation

struct MediaFile: Identifiable {
    let id: String = UUID().uuidString
    let tile: String
    let url: String
    let isExpanded: Bool = false
}

var MediaFileJson = [
    MediaFile(tile: "Nature", url: "1"),
    MediaFile(tile: "Ice", url: "2"),
    MediaFile(tile: "Sea", url: "3")
]
