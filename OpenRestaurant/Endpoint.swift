//
//  Endpoint.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-25.
//

import Foundation

// https://medium.com/flawless-app-stories/writing-network-layer-in-swift-protocol-oriented-approach-4fa40ef1f908
// https://matteomanferdini.com/network-requests-rest-apis-ios-swift/
protocol EndpointRequest {
    /// "https://domainName.com"
    var baseURL: String { get }
    /// "/some-path/"
    var path: String { get }
    
    var parameters: [URLQueryItem]? { get }
    
    var method: MethodType { get }
}

enum MethodType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
