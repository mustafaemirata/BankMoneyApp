//
//  HomeView.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 2.03.2026.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var isMenuOpen = false
    @EnvironmentObject var authModel: AuthViewModel
    
    var body: some View {
        ZStack {
            AppBackground()
                .ignoresSafeArea()
            
            VStack {
                Header()
                
                HStack(spacing: 30) {
                    Button(action: {
                        withAnimation(.spring()) {
                            isMenuOpen.toggle()
                        }
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                    HStack(spacing: 10) {
                        if searchText.isEmpty {
                            Text("Ara...")
                                .foregroundColor(.white.opacity(0.8))
                        }
                        
                        TextField("", text: $searchText)
                            .foregroundColor(.white)
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 20)
                
                if let user = authModel.currentUser {
                    AccountCard(user: user)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding()
                }
                
                Spacer()
            }
            .blur(radius: isMenuOpen ? 2 : 0)
            
            SideMenu(isShowing: $isMenuOpen)
        }
    }
}

#Preview {
    HomeView()
}

