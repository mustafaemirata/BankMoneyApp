//
//  LoginView.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//
import SwiftUI

import SwiftUI

struct LoginView: View {
    @State private var customerID = ""
    @State private var password = ""
    
    @EnvironmentObject var authModel: AuthViewModel

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
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(.bottom, 20)

                    VStack(spacing: 15) {
                        InputField(icon: "person.fill", placeholder: "Müşteri Kimlik No", text: $customerID)
                        InputField(icon: "key.fill", placeholder: "Şifre", text: $password, isSecure: true, keyboardType: .numberPad)
                    }
                    .padding(.horizontal, 30)

                    VStack(spacing: 20) {
                        Button(action: {
                            authModel.login(email: customerID, password: password)
                        }) {
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
                .blur(radius: authModel.isLoading ? 3 : 0)
                .disabled(authModel.isLoading)
                
                if authModel.isLoading {
                    ZStack {
                        Color.black.opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack(spacing: 15) {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(1.5)
                            Text("Giriş Yapılıyor...")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
