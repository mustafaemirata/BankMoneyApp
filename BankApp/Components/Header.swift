//
//  Header.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import SwiftUI

struct Header: View {
    var body: some View {
        Text("Bank Money App")
            .font(.system(size: 32, weight: .bold, design: .monospaced))
            .foregroundColor(.white.opacity(0.8))
            .padding(.top, 20)
    }
}

#Preview {
    Header()
}
