//
//  ButtonStyle.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import SwiftUI

struct ButtonStyle: View {
    @State var text:String
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
            .cornerRadius(12)
    }
}

#Preview {
    ButtonStyle(text: "default")
}
