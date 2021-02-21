//
//  NetworkingClient.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation

protocol NetworkingClient {
    func request<T: NetworkingEndpoint>(_ endpoint: T) -> T.DataResponse
}

protocol NetworkingEndpoint {
    associatedtype DataResponse: NetworkingReponse
    associatedtype DataRequest
    func asURLRequest() -> URLRequest
    func dataResponse(_ dataRequest: DataRequest) -> DataResponse
}

protocol NetworkingReponse {}

enum NetworkingRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case update = "UPDATE"
    case delete = "DELETE"
    case patch = "PATCH"
}
