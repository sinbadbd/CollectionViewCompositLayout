//
//  Review.swift
//  App Store
//
//  Created by sinbad on 3/28/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation

struct Reviews : Decodable {
    let feed : ReviewFeed
}
struct ReviewFeed : Decodable {
    let entry : [Entry]
}
struct Entry : Decodable {
    let author : Author
    let title: TitleLabel
    let content : Content
    let rating : RatingLabel
    
    private enum CodingKeys : String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}
struct Author : Decodable {
    let name : AutherName
}

struct AutherName : Decodable {
    let label : String
}
struct TitleLabel : Decodable{
    let label : String
}

struct Content : Decodable {
    let label : String
}
 
struct RatingLabel : Decodable {
    let label : String
}
