//
//  AccountCard.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 3.03.2026.
//

import SwiftUI

import SwiftUI

struct AccountCard: View {
    var user:User
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .top) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue)
                        .frame(width: 60, height: 45)
                    
                    HStack(spacing: 4) {
                        Text("₺")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium))
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 6, height: 6)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.firstName+" "+user.surname)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black.opacity(0.8))
                    
                    Text(String(user.accountNumber))
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 8)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.gray)
            }
            
            HStack {
                VStack(alignment: .center, spacing: 4) {
                    Text(String(user.balance))
                        .font(.system(size: 20, weight: .bold))
                    
                    Text("Kullanılabilir Bakiye")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 1, height: 40)
                
                VStack(alignment: .center, spacing: 4) {
                    Text(String(user.balance))
                        .font(.system(size: 20, weight: .bold))
                    
                    Text("Güncel Bakiye")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
        .padding()
    }
}

#Preview {
    ZStack {
        Color.blue.opacity(0.5).edgesIgnoringSafeArea(.all) 
        AccountCard(user: MockData.emptyBalanceUser)
    }
}
