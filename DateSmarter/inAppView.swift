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
            JContentView()
                .tabItem(){
                    Image(systemName: "megaphone.fill")
                    Text("Alert")
                }
            nicksView()
                .tabItem(){
                    Image(systemName: "exclamationmark.bubble.fill")
                    Text("Messages")
                }
            Contacts()
                .tabItem(){
                    Image(systemName: "book.closed.fill")
                    Text("Contacts")
                }
            minhsView()
                .tabItem(){
                    Image(systemName: "newspaper.circle.fill")
                    Text("Modules")
                }

        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        .navigationBarTitle("", displayMode: .inline)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

struct inAppView_Previews: PreviewProvider {
    static var previews: some View {
        inAppView()
    }
}

struct Example: View {
    var body: some View{
        ZStack{
            Color.mint
            Text("Hello World ")
            
        }
       
    }
}
