//
//  InputField.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//
import SwiftUI

struct InputField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                        .padding(.leading, 4)
                }
                
                if isSecure {
                    SecureField("", text: $text)
                        .keyboardType(keyboardType)
                        .autocapitalization(.none)
                } else {
                    TextField("", text: $text)
                        .keyboardType(keyboardType)
                        .autocapitalization(.none)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.08))
        .cornerRadius(12)
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
    }
}
