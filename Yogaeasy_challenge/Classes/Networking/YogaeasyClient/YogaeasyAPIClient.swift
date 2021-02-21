//
//  YogaeasyAPIClient.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation
import Alamofire

class YogaeasyAPIClient: NetworkingClient {
    private let session = Session()
    
    func request<T: NetworkingEndpoint>(_ endpoint: T) -> T.DataResponse {
        let dataRequest = self.session.request(endpoint.asURLRequest())
        return endpoint.dataResponse(dataRequest as! T.DataRequest)
    }
}
