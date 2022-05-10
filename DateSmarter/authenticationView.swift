//
//  authenticationView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 4/11/22.
//

import SwiftUI
import FirebaseAuth



class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    @Published var signedIn = false
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){ [weak self]
            result, error in
            guard result != nil, error == nil else {
                
                return
            }
            // Success
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) {[weak self]
            result, error in
            guard result != nil, error == nil else {
                return
            }
            // Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct authenticationView: View {
    @State var email = ""
    @State var password = ""
    @State private var showingAlert = false
    
    @EnvironmentObject var viewModel: AppViewModel
    var SOS_US = "911"
    var body: some View {
        VStack{
            // make logo a button that can call 911
            Button(action: {
                let cell = "tel://"
                let cellNumFormat = cell + SOS_US
                guard let url = URL(string: cellNumFormat) else {return}
                UIApplication.shared.open(url)
            }, label: {
                Image("Date (1)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            })
            VStack{
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                Button("Sign In") {
                    guard !email.isEmpty, !password.isEmpty else {
                        showingAlert = true
                        return
                    }
                    
                    viewModel.signIn(email: email, password: password)
                }
                .foregroundColor(Color.white)
                .frame(width: 200, height: 50)
                .cornerRadius(8)
                .background(Color.red)
                .alert("Enter email and password", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                
                NavigationLink("Create Account") {
                    signUpView()
                }
                .foregroundColor(.red)
                .padding()
            }
            .padding()
            
            Spacer()
        }
//        .navigationTitle("Sign In")
        
    }
}

struct signUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        VStack{
            Image("Date (1)")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            VStack{
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                   
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                Button("Create Account") {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signUp(email: email, password: password)
                }
                .foregroundColor(Color.white)
                .frame(width: 200, height: 50)
                .cornerRadius(8)
                .background(Color.red)
                
                
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Create Account")
        
    }
}
struct authenticationView_Previews: PreviewProvider {
    static var previews: some View {
        authenticationView()
    }
}
