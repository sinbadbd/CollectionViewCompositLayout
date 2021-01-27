//
//  Services.swift
//  App Store
//
//  Created by sinbad on 3/22/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation

class Services {
    
    static let shared = Services()
    
    func fetchApp(searchTerms: String, completon:@escaping(SearchResults?, Error?)-> Void) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerms)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completon)
    }
    
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/games/50/explicit.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/100/explicit.json"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    func fetchTopPodcasts(completion: @escaping (AppGroup?, Error?) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/podcasts/top-podcasts/all/10/explicit.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping(AppGroup?, Error? ) -> Void ){
        let urlString = "https://www.letsbuildthatapp.com/course/AppStore-JSON-APIs"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    func hearApiCall (completion: @escaping ([HeaderModel]?, Error?)->Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social" 
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping(T?, Error? ) -> Void ){
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                return
            }
            let decoder =  JSONDecoder()
            do {
                let appGroupResult = try decoder.decode(T.self, from: data!)
                completion(appGroupResult, nil)
            } catch {
                completion(nil, error)
                print("Fetch to load", error)
            }
        }
        task.resume()
    }
    
}
