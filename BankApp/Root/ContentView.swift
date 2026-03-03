//
//  ContentView.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        Group{
            if authModel.userSession != nil{
                HomeView()
            }else{
                LoginView()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
