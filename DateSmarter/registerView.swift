//
//  registerView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/20/22.
//

import SwiftUI

struct registerView: View {
    // IMPORTANT: VIEW MUST BE RAN FROM THE LOGIN. WILL CRASH IF YOU RUN FROM HERE BECAUSE ENVIRONEMENT OBJECT IS ASSOCIATED WITH LOGIN VIEW
        @SceneStorage("USERNAME_") var USERNAME_ = "" // data persistence
        @State var PASSWORD_ = "" 
    //    @State private var SWITCH = false
        @State private var showingAlert = false
        @State private var notif_Num = 0;
        var notification_class = popUpNotif()
        
        @EnvironmentObject var users: logIn // Changes done here will be reflected in the same dictionary through out the application
        
        var body: some View {
            ZStack{
                Color.mint
                VStack{
                    Text("Register Account View")
                    TextField("Username", text: $USERNAME_)
                        .modifier(textFields())
                    TextField("Password", text: $PASSWORD_)
                        .modifier(textFields())
                    Button("Confirm") {
                        if (users.addNewUser(name: USERNAME_, password: PASSWORD_)){ // if the user is added successfuly navigate to the homepage
                            notif_Num = 1
                            showingAlert = true
                        } else {
                            notif_Num = 0
                            showingAlert = true
                        }
                    }
                    .alert(notification_class.messageArray[notif_Num], isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                   
                    
                } // end of VStack
            }
                
            
            
            
            
            
        }
}

struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        registerView()
    }
}
