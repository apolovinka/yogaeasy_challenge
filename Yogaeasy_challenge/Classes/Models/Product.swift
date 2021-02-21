//
//  Product.swift
//  Yogaeasy_challenge
//
//  Created by Alex Polovinka on 20.02.21.
//

import Foundation

struct Products: Codable {
    let products: [Product]
}

struct Product: Codable {
    let id: Int
    let name: String
    let subscriptionCycleLength: Int
    let appleProductId: String
    
    // Fake description
    var description: String {
        (iAP(rawValue: self.appleProductId) ?? iAP.tier1).descitpion
    }
    
    // Fake price
    var price: String {
        (iAP(rawValue: self.appleProductId) ?? iAP.tier1).price
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case subscriptionCycleLength = "subscription_cycle_length"
        case appleProductId = "apple_product_id"
    }
}


// MARK: Fake Data

// In order to display more information on the screen with subscription options, fake data defined below
enum iAP: String {
    case tier1 = "de.yogaeasy.abo.1m"
    case tier2 = "de.yogaeasy.abo.6m"
    case tier3 = "de.yogaeasy.abo.12m"
    
    var descitpion: String {
        var duration = ""
        switch self {
        case .tier1: duration = "dem 1. Monat"
        case .tier2: duration = "6 Monaten"
        case .tier3: duration = "dem 1. Jahr"
        }
        return "Verlängert sich automatish für \(self.price) nach \(duration)"
    }
    
    var price: String {
        switch self {
        case .tier1: return "€11,99"
        case .tier2: return "€59,99"
        case .tier3: return "€96,99"
        }
    }
}
