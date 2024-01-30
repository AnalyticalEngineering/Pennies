//
//  AddTransactionView.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import SwiftUI
import SwiftData



struct AddTransactionView: View {
    ///MARK:  PROPERTIES
    @Environment(\.dismiss) var dismiss
    @State private var transactionTitle: String = ""
    @State private var transactionDescription: String = ""
    @State private var transactionAmount: Double = .zero
    @State private var date: Date = .now
    @State private var transactionCategory: TransactionCategory = .expense
    @State private var budgetName: String = ""
    @State private var budgetAmount: CGFloat = 0
    
    
    var body: some View {
        NavigationStack{
                    Form{
                        
                        TextField("Transaction Name", text: $transactionTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .tint(.secondaryText)
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 5)
                        TextField("Description", text: $transactionDescription)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 5)
                        /// Amount & Category Check Box
                        VStack(alignment: .leading, spacing: 10)  {
                            Text("Amount & TransactionType")
                                .font(.caption)
                                .foregroundStyle(.primary)
                                .hSpacing(.leading)
                            
                            HStack(spacing: 15) {
                                HStack(spacing: 4) {
                                    Text(currencySymbol)
                                        .font(.callout.bold())
                                    
                                    TextField("$0.00", value: $transactionAmount, formatter: numberFormatter)
                                        .keyboardType(.decimalPad)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .foregroundStyle(.primary)
                                        .padding(.horizontal)
                                }
                                .padding(.horizontal, 15)
                                .padding(.vertical, 12)
                                .background(.background, in: .rect(cornerRadius: 10))
                                .frame(maxWidth: 200)
                            }
                            /// Custom Check Box
                            CategoryCheckBox()
                                .padding(.horizontal, 7)
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.vertical)
                }
            .navigationTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
        
        }
    
    
    /// Number Formatter
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
}

#Preview {
    AddTransactionView()
}
