//
//  NetworkingURLRequestBuilder.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Alamofire

class NetworkingURLRequestBuilder {
    class func buildURLRequest(basePath: String, path: String, method: String, parameters: [String: Any]?) -> URLRequest {
        let urlString = basePath + "/" + path
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        if let urlRequest = try? JSONEncoding.default.encode(urlRequest, with: parameters) {
            return urlRequest
        }
        return urlRequest
    }
}
