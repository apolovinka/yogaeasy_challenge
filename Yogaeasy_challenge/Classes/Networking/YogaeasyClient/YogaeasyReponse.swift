//
//  YogaeasyReponse.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation
import Alamofire

class YogaeasyReponse: NetworkingReponse {
    private let dataRequest: DataRequest
    private let decoder = JSONDecoder()
    
    init(dataRequest: DataRequest) {
        self.dataRequest = dataRequest
    }
    
    func decodableJSONResponse<T: Decodable>(type: T.Type, completion: @escaping (Result<T, Error>) -> ()) {
        self.dataRequest.responseDecodable(of: type, decoder: self.decoder) {
            result in
            // Map AFError to Error
            completion(result.result.mapError{$0.underlyingError ?? $0})
        }
    }
}
