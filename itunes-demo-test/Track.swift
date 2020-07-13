//
//  Track.swift
//  itunes-demo-test
//
//  Created by Ostrenkiy on 12.07.2020.
//  Copyright © 2020 Ostrenkiy. All rights reserved.
//

import UIKit

struct Track: Decodable {
    var imagePath: String
    var title: String
    var artist: String
    
    enum CodingKeys: String, CodingKey {
        case imagePath = "artworkUrl100"
        case artist = "artistName"
        case title = "trackName"
    }
}

struct TracksResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}
