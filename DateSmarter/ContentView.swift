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
    @State private var selection = 0
    var body: some View {
        
        TabView(selection: $selection){
            if viewModel.signedIn {
                NavigationView{
                    nicksView(models: Model())
                }
                .tabItem(){
                    Image(systemName: "message.circle.fill")
                    Text("Help Request")
                }
                .tag(0)
                NavigationView{
                    minhsView()
                }
                .tabItem(){
                    Image(systemName: "newspaper.circle.fill").imageScale(.large)
                    Text("Saftey Tips")
                }
                .tag(1)
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


