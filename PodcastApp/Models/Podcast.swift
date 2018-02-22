//
//  Podcast.swift
//  PodcastApp
//
//  Created by Kilian on 15.02.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
}
