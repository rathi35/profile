//
//  APIRequest.swift
//  Profile
//
//
//

import Foundation

enum APIRequest: APIRequestProtocol {
    
    case profileInfo
    
    var baseURL: String? {
        switch self {
        case .profileInfo:
            return profileInfoURL
        }
    }
    
    var path: String? {
        return nil
    }
    
    var parameters: RequestParams? {
        return nil
    }
}

