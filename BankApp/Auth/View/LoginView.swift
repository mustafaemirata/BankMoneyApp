//
//  LoginView.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//
import SwiftUI

struct LoginView: View {
    @State private var customerID = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackground()
         
                VStack(spacing: 25) {
                    Header()
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Image("card")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        
                        VStack(spacing: 8) {
                         
                            Text("Müşteri bilgilerinizle giriş yapın")
                                .font(.largeTitle.bold())

                                .foregroundColor(.white.opacity(0.6))
                        }
                    }
                    .padding(.bottom, 20)

                    VStack(spacing: 15) {
                        InputField(icon: "person.fill", placeholder: "Müşteri Kimlik No", text: $customerID, keyboardType: .numberPad)
                        InputField(icon: "key.fill", placeholder: "Şifre", text: $password, isSecure: true, keyboardType: .numberPad)
                    }
                    .padding(.horizontal, 30)

                    VStack(spacing: 20) {
                        Button(action: {  }) {
                            ButtonStyle(text: "Giriş Yap")
                        }

                        NavigationLink(destination: RegisterView()) {
                            HStack {
                                Text("Müşterimiz değil misiniz?")
                                    .foregroundColor(.white.opacity(0.7))
                                Text("Hemen Kaydol")
                                    .foregroundColor(.blue)
                                    .bold()
                            }
                        }
                    }
                    .padding(.horizontal, 30)

                    Spacer()
                }
            }
        }
    }
}



#Preview {
    LoginView()
}
