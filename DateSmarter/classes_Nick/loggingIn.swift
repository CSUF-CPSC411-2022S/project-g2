//
//  loggingIn.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/20/22.
//

import Foundation
class logIn: ObservableObject, Identifiable {
    @Published var userDict: [String: String] = ["Nicholas":"1234", "1":"1"] // dictionary to store user_name & password
    
    func inti(){
    }
    
    
    // use this function is user wants to create an account
    func addNewUser(name: String, password: String)-> Bool{
        if (name == "" ||  password == "") { // if username or password is empty return false
            return false
        } else if ((userDict[name] == nil)){
            userDict[name] = password
            return true
        } else {
            return false
        }
    }
    
    
    // returns true if the password the user entered is correct
    func checkUser(name: String, password: String) -> Bool{
        if (userDict[name] == password){
            return true
        } else {
            return false
        }
    }
}
