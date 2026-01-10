//
//  FetchService.swift
//  BBQuotes
//
//  Created by ceboi on 08/01/26.
//

import Foundation

struct FetchService {
    private enum FetchError: Error {
        case badResponse
    }
    
    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")! // kalo ga make "!" , nnt ketika di pake variable nya bakal perlu "?"
    
    // https://breaking-bad-api-six.vercel.app/api/quotes/random?production=Breaking+Bad
    func fetchQuote(from show: String) async throws -> Quote {
        // Build fetch url
        let quoteUrl = baseURL.appending(path: "quotes/random")
        let fetchURL = quoteUrl.appending(queryItems: [URLQueryItem(name: "production", value: show)])
        
        // fetch data
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        // handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { // ini kaya ada 2 guard, pertama cek response nya adalah httpurlresponse dan status code nya 200
            throw FetchError.badResponse
        }
        // decode data
        let quote = try JSONDecoder().decode(Quote.self, from: data) // make Quote.self karna me refer ke property yang ada di dalam Quote, kalau Quote aja berarti hanya struct data Quote
        
        // return quote
        return quote
    }
    
    func fetchCharacter(_ name: String) async throws -> Char {
        let characterURL = baseURL.appending(path: "characters")
        let fetchURL = characterURL.appending(queryItems: [URLQueryItem(name: "name", value: name)])
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let characters = try decoder.decode([Char].self, from: data)
        
        return characters[0] // karena api nya case sensitif dan return nya array tapi hanya berisi 1 data character doang
    }
    
    func fetchDeath(for character: String) async throws -> Death? {
        let deathURL = baseURL.appending(path: "deaths")
        
        let (data, response) = try await URLSession.shared.data(from: deathURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deaths = try decoder.decode([Death].self, from: data)
        
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        return nil
        
    }
}
