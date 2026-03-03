//
//  MockData.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 3.03.2026.
//

import Foundation

struct MockData {
   
    static let emptyBalanceUser = User(
        id: "mock_id_2",
        customerNo: "12345678",
        firstName: "Emir",
        surname: "Ata",
        email: "emir@example.com",
        birthDate: Date(),
        iban: "TR00 0000 0000 0000 0000 0000",
        accountNumber: 999999,
        balance: 0.0,
        limit: 1000.0,
        debt: 500.0
    )
}
