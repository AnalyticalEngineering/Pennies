//
//  Budget.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import Foundation
import SwiftData



@Model
class Budget {
    var budgetName: String
    var budgetAmount: Double 
    /// Category Expenses
    @Relationship(deleteRule: .cascade, inverse: \Transaction.budget)
    var transactions: [Transaction]?
    
    init(budgetName: String, budgetAmount: Double, expenses: [Transaction]? = nil) {
        self.budgetName = budgetName
        self.budgetAmount = budgetAmount
        self.transactions = transactions
    }
}
