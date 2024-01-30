//
//  CategoryCheckBox.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import SwiftUI

struct CategoryCheckBox: View {
    @State private var transactionCategory: TransactionCategory = .expense
    
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(TransactionCategory.allCases, id: \.rawValue) { transactionCategory in
                HStack(spacing: 5) {
                    ZStack {
                        Image(systemName: "circle")
                            .font(.title3)
                            .foregroundStyle(appTint)
                        
                        if self.transactionCategory == transactionCategory {
                            Image(systemName: "circle.fill")
                                .font(.caption)
                                .foregroundStyle(appTint)
                        }
                    }
                    
                    Text(transactionCategory.rawValue)
                        .font(.caption)
                }
                .contentShape(.rect)
                .onTapGesture {
                    self.transactionCategory = transactionCategory
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        
    }
}
#Preview {
    CategoryCheckBox()
}
