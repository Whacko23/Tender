//
//  Subscription.swift
//  Tender
//
//  Created by Rajanish Karki on 7/24/22.
//

import Foundation


struct Subscription: Identifiable{
    let id = UUID()
    
    var month: Int
    var monthlyCost: Double
    var totalCost: Double
    var savePercent: Int?
    var tagLine: TagLine = .none
    
    enum TagLine: String {
        case mostPopular = "MOST POPULAR"
        case bestValue = "BEST VALUE"
        case none
    }
    
}

extension Subscription{
    static let example1 = Subscription(month: 6, monthlyCost: 14.99, totalCost: 89.94, savePercent: 50, tagLine: .bestValue)
    static let example2 = Subscription(month: 3, monthlyCost: 19.99, totalCost: 59.94, savePercent: 30, tagLine: .mostPopular)
    static let example3 = Subscription(month: 1, monthlyCost: 29.99, totalCost: 29.99)
}
