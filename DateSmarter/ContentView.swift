//
//  ContentView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/9/22.
//

import SwiftUI
import MessageUI

struct ContentView: View {
    
//    @State var result: Result<MessageComposeResult, Error>? = nil
//    @State var isShowingMailView = false
    
    @EnvironmentObject var viewModel: AppViewModel
    init(){
        UINavigationBar.setAnimationsEnabled(true)
    }
    
    var body: some View {
        TabView{
            if viewModel.signedIn {
                NavigationView{
                    nicksView(models: Model())
                }
                .tabItem(){
                    Image(systemName: "exclamationmark.bubble.fill")
                    Text("Help Request")
                }
                
                NavigationView{
                    signOut()
                }
                .tabItem(){
                    Image(systemName: "exclamationmark.bubble.fill")
                    Text("Sign Out")
                }
                
                NavigationView{
                    Contacts()
                }
                .tabItem(){
                    Image(systemName: "exclamationmark.bubble.fill")
                    Text("Contacts")
                }
            }
            else {
                NavigationView{
                    authenticationView()
                }
                
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
        
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



