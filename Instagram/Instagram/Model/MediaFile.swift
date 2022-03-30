//
//  MediaFile.swift
//  Instagram
//
//  Created by Rahul on 30/03/22.
//

import Foundation

struct MediaFile: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let url: String
    let isExpanded: Bool = false
}

var MediaFileJson = [
    MediaFile(title: "Nature is made of everything we see around us", url: "1"),
    MediaFile(title: "ce is the solid state of water, a normally liquid substance that freezes to the solid state at temperatures of 0 °C (32 °F) or lower ", url: "2"),
    MediaFile(title: "Sea is a large body of saltwater surrounded in whole or in parts by land.", url: "3")
]
