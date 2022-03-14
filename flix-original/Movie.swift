//
//  Movie.swift
//  flix-original
//
//  Created by Anderson David on 3/14/22.
//

import Foundation

struct Movie: Codable {
    static let bannerBaseURL = "https://image.tmdb.org/t/p/w500/"
    static let posterBaseURL = "https://image.tmdb.org/t/p/w185/"
    static let errorURL = "https://miro.medium.com/max/800/1*hFwwQAW45673VGKrMPE2qQ.png"
    
    let title: String
    let description: String
    let poster: URL
    let banner: URL
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "overview"
        case poster = "poster_path"
        case banner = "backdrop_path"
    }
    
    init(title: String, description: String, poster: URL = URL(string: Movie.errorURL)!, banner: URL = URL(string: Movie.errorURL)!) {
        self.title = title
        self.description = description
        self.poster = poster
        self.banner = banner
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let title = try container.decode(String.self, forKey: .title)
        let description = try container.decode(String.self, forKey: .description)
        
        let posterPath = try container.decode(String.self, forKey: .poster)
        var poster:URL? = nil
        if let posterURL = URL(string: Movie.posterBaseURL + posterPath) {
        // if let posterURL = poster {
            poster = posterURL
        }
        else {
            poster = URL(string: Movie.errorURL)
        }
        
        let bannerPath = try container.decode(String.self, forKey: .banner)
        var banner:URL? = nil
         if let bannerURL = URL(string: Movie.bannerBaseURL + bannerPath) {
            banner = bannerURL
        }
        else {
            banner = URL(string: Movie.errorURL)
        }
        
        self.init(title: title, description: description, poster: poster!, banner: banner!)
    }
}
