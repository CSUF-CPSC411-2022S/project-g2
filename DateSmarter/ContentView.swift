//
//  ContentView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var users = logIn()
    @SceneStorage("USERNAME") var USERNAME = "" // data persistence
//    @State var USERNAME = ""
    
    // For Password Field
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    @State var PASSWORD = ""
    
    @State private var SWITCH = false
    @State private var showingAlert = false

    
    var body: some View {
        
        NavigationView{
            VStack{
                LOGO()
                    .frame(width: 150, height: 150)
               
                TextField("Username", text: $USERNAME)
                    .modifier(textFields())
                
                HStack {
                        ZStack(alignment: .trailing) {
                            TextField("Password", text: $PASSWORD)
                                .modifier(textFields())
                                .focused($focus1)
                                .opacity(showPassword ? 1 : 0)
                            SecureField("Password", text: $PASSWORD)
                                .modifier(textFields())
                                .focused($focus2)
                                .opacity(showPassword ? 0 : 1)
                            Button(action: {
                                showPassword.toggle()
                                if showPassword { focus1 = true } else { focus2 = true }
                            }, label: {
                                Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill").font(.system(size: 16, weight: .regular))
                                    .padding()
                            })
                        }
                    }
                
                
                
                
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
