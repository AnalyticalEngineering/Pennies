//
//  GroupedExpense.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import SwiftUI

struct GroupedTransactions: Identifiable {
    var id: UUID = .init()
    var date: Date
    var transactions: [Transaction]
    
    /// Group Title
    var groupTitle: String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "Yesterday"
        } else {
            return date.formatted(date: .abbreviated, time: .omitted)
        }
    }
}

