//
//  AppGroup.swift
//  App Store
//
//  Created by sinbad on 3/23/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation

struct AppGroup : Decodable {
    let feed : Feed
}
struct Feed : Decodable {
    let title : String
    let results : [FeedResult]
}

struct FeedResult : Decodable {
    let id, name, artistName, artworkUrl100 : String
}

