//
//  NetworkingEndpoint.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation
import Alamofire

enum YogaeasyEndpoint: NetworkingEndpoint {
    typealias DataResponse = YogaeasyReponse
    typealias DataRequest = Alamofire.DataRequest
    
    case products
    
    func dataResponse(_ dataRequest: DataRequest) -> DataResponse {
        return YogaeasyReponse(dataRequest: dataRequest)
    }
    
    func asURLRequest() -> URLRequest {
        NetworkingURLRequestBuilder
            .buildURLRequest(
                basePath: self.basePath,
                path: self.path,
                method: self.method.rawValue,
                parameters: self.parameters)
    }
    
    // MARK: Private
    
    private var basePath: String {
        Configuration.API.baseURL + "/" + Configuration.API.version
    }
    
    private var path: String {
        switch self {
        case .products:
            return "products"
        }
    }
    
    private var method: NetworkingRequestMethod {
        switch self {
        case .products:
            return .get
        }
    }
    
    private var parameters: [String : Any]? {
        nil
    }
}
