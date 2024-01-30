//
//  Expense.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import SwiftUI
import SwiftData

@Model
class Transaction: Codable {
    /// Expense Properties
    var transactionTitle: String
    var transactionDescription: String
    var transactionAmount: Double
    var date: Date
    var transactionCategory: String
    var tintColor: String
    var enableRemainder: Bool = false
    var remainderID: String = ""
    /// Expense Budget
    var budget: Budget?
    
    init(transactionTitle: String, transactionDescription: String, transactionCategory: String, tintColor: TintColor, transactionAmount: Double, date: Date, budget: Budget? = nil) {
        self.transactionTitle = transactionTitle
        self.transactionDescription = transactionDescription
        self.transactionAmount = transactionAmount
        self.transactionCategory = transactionCategory
        self.tintColor = tintColor.color
        self.date = date
        self.budget = budget
    }
    /// Conforming Codable Protocol
    enum CodingKeys: CodingKey {
        case transactionTitle
        case transactionDescription
        case transactionAmount
        case date
        case transactionCategory
        case tintColor
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transactionTitle = try container.decode(String.self, forKey: .transactionTitle)
        transactionDescription = try container.decode(String.self, forKey: .transactionDescription)
        transactionAmount = try container.decode(Double.self, forKey: .transactionAmount)
        date = try container.decode(Date.self, forKey: .date)
        transactionCategory = try container.decode(String.self, forKey: .transactionCategory)
        tintColor = try container.decode(String.self, forKey: .tintColor)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transactionTitle, forKey: .transactionTitle)
        try container.encode(transactionDescription, forKey: .transactionDescription)
        try container.encode(transactionAmount, forKey: .transactionAmount)
        try container.encode(date, forKey: .date)
        try container.encode(transactionCategory, forKey: .transactionCategory)
        try container.encode(tintColor, forKey: .tintColor)
    }
    
    /// Extracting Color Value from tintColor String
    @Transient
    var color: Color {
        return tints.first(where: { $0.color == tintColor })?.value ?? Constants.shared.tintColor
    }
    
    @Transient
    var tint: TintColor? {
        return tints.first(where: { $0.color == tintColor })
    }
    /// Currency String
    @Transient
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(for: transactionAmount) ?? ""
    }
}
