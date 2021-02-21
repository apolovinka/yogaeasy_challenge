//
//  ProductsService.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation

class ProductsService {
    private let networkingClient: NetworkingClient
    
    init(networkingClient: NetworkingClient) {
        self.networkingClient = networkingClient
    }
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>)->Void) {
        self.networkingClient.request(YogaeasyEndpoint.products)
            .decodableJSONResponse(type: Products.self) {
                result in
                completion(result.map{$0.products})
            }
    }
}
