//
//  ContentView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var users = logIn()
    @State var USERNAME = ""
    @State var PASSWORD = ""
    @State private var SWITCH = false
    @State private var showingAlert = false

    
    var body: some View {
        
        NavigationView{
            VStack{
                LOGO()
                    .frame(width: 150, height: 150)
               
                TextField("USERNAME", text: $USERNAME)
                    .modifier(textFields())
                TextField("PASSWORD", text: $PASSWORD)
                    .modifier(textFields())
                Button("LOG IN") {
                    if (users.checkUser(name: USERNAME, password: PASSWORD)){
                        SWITCH = true;
                    }else{
                        showingAlert = true
                    }
                }
                .alert("Username or password is invalid. Please try again.", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                .modifier(buttonMod())
                
                
                NavigationLink(
                    "User is Valid",
                    destination: inAppView().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    isActive: $SWITCH
                    
                )
                .background(.white)
                .foregroundColor(.white)
                .disabled(true)
                
                
                // insert navigation link to create an account
                NavigationLink(
                    "Register",
                    destination: registerView().navigationBarBackButtonHidden(false).navigationBarHidden(false)
                )
            }
                
        }.environmentObject(users)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct LOGO: View {
    var body: some View{
        return Image("DateSafeSmallBlack")
        
    }
}
