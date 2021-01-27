//
//  SearchResult.swift
//  App Store
//
//  Created by sinbad on 3/22/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation


struct SearchResults : Decodable {
    let resultCount : Int
    let results : [Results]
}

struct Results : Decodable {
    let trackId : Int
    let trackName : String
    let primaryGenreName : String
    var averageUserRating : Float?
    var screenshotUrls : [String]?
    let artworkUrl100 : String
    var formattedPrice : String?
    var description : String?
    var releaseNotes : String?
    
    
}
