//
//  inAppView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/20/22.
//

import SwiftUI

struct inAppView: View {
 
    var body: some View {
        TabView{
            //            minhsView()
            //                .tabItem(){
            //                    Image(systemName: "newspaper.circle.fill")
            //                    Text("Minh's View")
            //                }
            //            JContentView()
            //                .tabItem(){
            //                    Image(systemName: "megaphone.fill")
            //                    Text("SOS Button")
            //                }
            nicksView()
                .tabItem(){
                    Image(systemName: "exclamationmark.bubble.fill")
                    Text("Help Request")
                }
            Contacts()
                .tabItem(){
                    Image(systemName: "book.closed.fill")
                    Text("Contact's")
                }
//            signOut()
//                .tabItem(){
//                    Image(systemName: "book.closed.fill")
//                    Text("Contact's")
//                }
//            .navigationBarBackButtonHidden(true)
//            .navigationBarHidden(true)
//            
//            .navigationBarTitle("", displayMode: .inline)
//            .edgesIgnoringSafeArea([.top, .bottom])
        }
    }
}
struct inAppView_Previews: PreviewProvider {
    static var previews: some View {
        inAppView()
    }
}

struct signOut: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View{
        
        Button(action: {
            viewModel.signOut()
        }, label: {
            Text("Sign Out")
                .foregroundColor(Color.red)
        })
        .environmentObject(viewModel)
    }
}
