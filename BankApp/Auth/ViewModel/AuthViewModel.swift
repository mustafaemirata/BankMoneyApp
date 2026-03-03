//
//  AuthViewModel.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import Foundation
import Combine
import FirebaseAuth
import SwiftUI
import FirebaseFirestore


class AuthViewModel:ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var errorMessage: String?
    @Published var currentUser: User?
    
    @Published var customerID=""
    @Published var password=""
    @Published var firstName=""
    @Published var surname=""
    @Published var email=""
    @Published var birthDate=Date()
    
    @Published var isLoading=false
    @Published var isAuthenticated=false
    
    private let db=Firestore.firestore()
    init(){
        self.userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        db.collection("users").document(uid).getDocument { snapshot, error in
            DispatchQueue.main.async {
                guard let data = snapshot?.data() else { return }
                let birthTimestamp = data["birthDate"] as? Timestamp
                self.currentUser = User(
                    id: data["id"] as? String,
                    customerNo: data["customerNo"] as? String ?? "",
                    firstName: data["firstname"] as? String ?? "",
                    surname: data["surname"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    birthDate: birthTimestamp?.dateValue() ?? Date(),
                    iban: data["iban"] as? String ?? "",
                    accountNumber: data["accountNumber"] as? Int ?? 0,
                    balance: data["balance"] as? Double ?? 0.0,
                    limit: data["limit"] as? Double ?? 0.0,
                    debt: data["debt"] as? Double ?? 0.0
                )
            }
        }
    }
    
    func login(){
        
    }
    
    func register(email:String,password:String,firstName:String,surname:String,birthDate:Date){
        
        isLoading=true
        self.firstName=firstName
        self.surname=surname
        generateUniqueCustomerNo{ uniqueNo in
            
            Auth.auth().createUser(withEmail: email, password: password){result,error in
                DispatchQueue.main.async {
                    if let error=error{
                        self.errorMessage=error.localizedDescription
                        return
                    }
                    self.userSession=result?.user
                }
                guard let uid=result?.user.uid else{return}
                
                let userData:[String:Any]=[
                "id": uid,
                "customerNo": uniqueNo,
                "firstname": self.firstName,
                "surname":self.surname,
                "email": email,
                "birthDate": Timestamp(date: birthDate),
                "accountNumber": Int.random(in: 100000...999999),
                "balance": 0.0,
                "limit": 5000.0,
                "debt": 0.0,
                "iban": "TR\(Int.random(in: 10...99)) 0006 2000 \(uniqueNo) 5001"
                ]
                
                self.db.collection("users").document(uid).setData(userData){error in
                    DispatchQueue.main.async {
                        self.isLoading=false
                        if let error=error{
                            self.errorMessage=error.localizedDescription
                        }else{
                            self.userSession=result?.user
                            self.fetchUser()
                        }
                    }
                }
                
                
            }
            
            
            
        }
    }
    
    func signout(){
        try? Auth.auth().signOut()
        self.userSession=nil
        
    }
    
    
    
    
    func login(email:String,password:String){
        isLoading=true
        Auth.auth().signIn(withEmail: email, password: password){result,error in
            DispatchQueue.main.async {
                self.isLoading=false
                if let error=error{
                    self.errorMessage=error.localizedDescription
                    return
                }
                self.userSession=result?.user
                self.fetchUser()
            }
        }
    }
    
    
    private func generateUniqueCustomerNo(completion: @escaping (String) -> Void) {
        let newNo = String(Int.random(in: 10000000...99999999))
        
        db.collection("users").whereField("customerNo", isEqualTo: newNo).getDocuments { snapshot, error in
            if let snapshot = snapshot, !snapshot.isEmpty {
                self.generateUniqueCustomerNo(completion: completion)
            } else {
                completion(newNo)
            }
        }
    }
}
