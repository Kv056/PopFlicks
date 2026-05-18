//
//  MovieEndpoint.swift
//  PopFlicks
//
//  Created by Phycom on 18/05/26.
//

import Foundation

enum MovieListEndpoint:
    Endpoint {
    
    case PopularMovies
    
    var path: String {
        switch self {
        case .PopularMovies:
            return APIConstants.Paths.popularMovie
        }
    }
    
    var method:
    HTTPMethod {
        switch self {
        case .PopularMovies:
            return .GET
        }
    }
    
    var headers:
    [String : String]? {
        nil
    }
    
    var queryItems:
    [URLQueryItem]? {
        nil
    }
    
    var body: Data? {
        nil
    }
}
