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
            Example()
                .tabItem(){
                    Image(systemName: "newspaper.circle.fill")
                    Text("Minh's View")
                }
            Example()
                .tabItem(){
                    Image(systemName: "megaphone.fill")
                    Text("Jeein's View")
                }
            nicksView()
                .tabItem(){
                    Image(systemName: "exclamationmark.bubble.fill")
                    Text("Nick's View")
                }
            Example()
                .tabItem(){
                    Image(systemName: "book.closed.fill")
                    Text("Contact's")
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