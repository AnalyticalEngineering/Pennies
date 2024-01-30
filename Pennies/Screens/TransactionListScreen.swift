//
//  TransactionListView.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import SwiftUI

struct TransactionListScreen: View {
    @State private var addTransaction: Bool = false
    @State private var showSideMenu: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .navigationTitle("Transactions")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    
                    Button(action: {
                        HapticManager.notification(type: .success)
                        addTransaction.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 40)
                            .background(appTint.gradient, in: .circle)
                            .contentShape(.circle)
                    })
                }
                ToolbarItem(placement: .topBarLeading){
                    
                    Button(action: {
                        HapticManager.notification(type: .success)
                        showSideMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 40)
                            .background(appTint.gradient, in: .circle)
                            .contentShape(.circle)
                    })
                }
            }
            .sheet(isPresented: $addTransaction) {
                AddTransactionView()
                    .interactiveDismissDisabled()
            }
        }
    }
}
#Preview {
    TransactionListScreen()
}
