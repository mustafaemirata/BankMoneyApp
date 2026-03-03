//
//  BankAppApp.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import SwiftUI
import Firebase

@main
struct BankAppApp: App {
    @StateObject var authModel=AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authModel)
        }
    }
}
