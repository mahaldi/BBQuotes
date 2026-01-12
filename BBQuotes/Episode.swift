//
//  Episode.swift
//  BBQuotes
//
//  Created by ceboi on 12/01/26.
//

import Foundation

struct Episode: Codable {
    let title: String
    let airDate: String
    let episode: Int
    let synopsis: String
    let directedBy: String
    let image: URL
    let writtenBy: String
    
    var seasonEpisode: String {
        "Season \(episode / 100) Episode \(episode & 100)"
    }
}
