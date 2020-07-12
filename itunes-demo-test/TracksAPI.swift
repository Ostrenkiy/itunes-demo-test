//
//  TracksAPI.swift
//  itunes-demo-test
//
//  Created by Ostrenkiy on 12.07.2020.
//  Copyright © 2020 Ostrenkiy. All rights reserved.
//

import Foundation
import UIKit

class TracksAPI {
    func getTracks(query: String) -> [Track] {
        return [
            Track(image: UIImage(named: "cover1")!, title: "Track 1", artist: "Imagine Dragons"),
            Track(image: UIImage(named: "cover2")!, title: "Track 2", artist: "Imagine Dragons"),
            Track(image: UIImage(named: "cover3")!, title: "Track 3", artist: "Imagine Dragons feat. Somebody")
        ]
    }
}
