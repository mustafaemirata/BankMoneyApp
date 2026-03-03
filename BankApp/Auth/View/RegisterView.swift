//
//  LoginView.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import SwiftUI

struct RegisterView: View {
    @State private var fullName = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var birthDate = Date()
    @State private var password = ""
    
    @EnvironmentObject var authModel: AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            AppBackground()
            
            VStack(spacing: 20) {
               Header()
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Yeni Hesap Oluştur")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
               
                }
                .padding(.bottom, 20)

                VStack(spacing: 15) {
                    InputField(icon: "person.fill", placeholder: "Ad", text: $fullName)
                    InputField(icon: "person.fill", placeholder: "Soyad", text: $surname)
                    
                    
                    InputField(icon: "envelope.fill", placeholder: "E-posta", text: $email, keyboardType: .emailAddress)
                    
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                            .frame(width: 30)
                        
                        DatePicker("Doğum Tarihi", selection: $birthDate, displayedComponents: .date)
                            .labelsHidden()
                            .colorInvert()
                            .colorMultiply(.white)
                        
                        Spacer()
                        
                        Text("Doğum Tarihi")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.1), lineWidth: 1))
                    
                    InputField(icon: "key.fill", placeholder: "Şifre", text: $password, isSecure: true, keyboardType: .numberPad)
                    Text("Şifreniz 6 sayıdan oluşmalıdır.")
                        .foregroundColor(.white.opacity(0.5))
                   
                }
                .padding(.horizontal, 30)

                Button(action: {
                    authModel.register(email: email, password: password, firstName: fullName, surname: surname, birthDate: birthDate)
                    
                    
                })
                {
                    ButtonStyle(text: "Hesap Oluştur")
                    //yükleme yapıyosak
                    if authModel.isLoading{
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    }
                }
                .disabled(authModel.isLoading)
                .padding(.horizontal, 30)
                .padding(.top, 10)

                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Text("Hesabınız var mı?")
                            .foregroundColor(.white.opacity(0.7))
                        Text("Giriş yapın!")
                            .foregroundColor(.blue)
                            .bold()
                    }
                }

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RegisterView()
}
