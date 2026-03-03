//
//  User.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import Foundation
struct User:Codable{
    var id:String?
    var customerNo:String
    var firstName:String
    var surname:String

    var email:String
    var birthDate:Date
    var iban:String
    var accountNumber:Int
    var balance:Double
    var limit:Double
    var debt:Double
}
