//
//  TransactionCardView.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import SwiftUI

struct TransactionCardView: View {
    @Environment(\.modelContext) private var context
    @Bindable var transaction: Transaction
    var displayTag: Bool = true
    var showsCategory: Bool = false
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.transactionTitle)
                
                Text(transaction.transactionDescription)
                    .font(.caption)
                    .foregroundStyle(.colorGrey)
                
                if let budgetName = transaction.budget?.budgetName, displayTag {
                    Text(budgetName)
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(.red.gradient, in: .capsule)
                }
            }
            .lineLimit(1)
            
            Spacer(minLength: 5)
            
            /// Currency String
            Text(transaction.currencyString)
                .font(.title3.bold())
        }
    }
}
#Preview {
    ContentView()
}
