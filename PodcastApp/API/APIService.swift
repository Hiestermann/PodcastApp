//
//  APIService.swift
//  PodcastApp
//
//  Created by Kilian on 21.02.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit
import Alamofire


class APIService {
    static let shared = APIService()
    
    let baseITunesSearchURL = "https://itunes.apple.com/search"
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {

        let parameters = ["term": searchText, "media": "podcast"]
        Alamofire.request(baseITunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            if let err = dataResponse.error {
                print("Failed to contact yahoo", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                searchResult.results.forEach({ (podcast) in
                })
                completionHandler(searchResult.results)

            } catch let decodeErr {
                print("Failed to decode: ", decodeErr)
            }
            
        }
    }
}


struct SearchResults: Decodable {
    let resultCount: Int
    let results: [Podcast]
}
