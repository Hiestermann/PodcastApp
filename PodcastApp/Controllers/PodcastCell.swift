//
//  PodCastCell.swift
//  PodcastApp
//
//  Created by Kilian on 21.02.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {

    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var ArtistNameLabel: UILabel!
    @IBOutlet weak var EpisodeCount: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            ArtistNameLabel.text = podcast.artistName
            
            EpisodeCount.text = "\(podcast.trackCount ?? 0) Episides"
            
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else  { return }
            
            podcastImageView.sd_setImage(with: url)
        }
    }
}
