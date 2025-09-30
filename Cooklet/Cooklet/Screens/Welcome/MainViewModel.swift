//
//  MainViewModel.swift
//  Cooklet
//
//  Created by Nxtwave on 18/08/25.
//

import SwiftUI
import Combine
import Foundation


class MainViewModel: ObservableObject {
    @Published var username: String = "Charu"
    @Published var password: String = "0706"
    @Published var enteredUsername: String = ""
    @Published var enteredPassword: String = ""
    @Published  var email: String = ""
    @Published  var isLoggedIn: Bool = false
    @Published var Error: String = ""
    @Published var Alertmsg: Bool = false
    @Published var newUsername: String = ""
    @Published var newPassword: String = ""
    
    
    
    func useAuthentication() {
        if username == enteredUsername && password == enteredPassword {
            isLoggedIn = true
        }
        else{
            Error = "Invalid Credentials"
            Alertmsg = true
        }
    }
    }






