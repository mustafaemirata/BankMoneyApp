//
//  AuthViewModel.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import Foundation
import Combine
class AuthViewModel:ObservableObject{
    @Published var customerID=""
    @Published var password=""
    @Published var fullName=""
    @Published var email=""
    @Published var birthDate=Date()
    
    @Published var isLoading=false
    @Published var errorMessage:String?
    @Published var isAuthenticated=false
    
    func login(){
        
    }
    
}
