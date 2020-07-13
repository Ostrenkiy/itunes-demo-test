//
//  TrackTableViewCell.swift
//  itunes-demo-test
//
//  Created by Ostrenkiy on 12.07.2020.
//  Copyright © 2020 Ostrenkiy. All rights reserved.
//

import UIKit
import Nuke

class TrackTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWith(track: Track) {
        if let url = URL(string: track.imagePath) {
            Nuke.loadImage(with: url, into: coverImageView)
        }
        titleLabel.text = track.title
        artistLabel.text = track.artist
    }
}
