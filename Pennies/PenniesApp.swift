//
//  PenniesApp.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import SwiftUI
import SwiftData

@main
struct PenniesApp: App {
    var body: some Scene {
        WindowGroup {
         TransactionListScreen()
        }
        /// Setting Up the Container
        .modelContainer(for: [Transaction.self, Budget.self])
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
