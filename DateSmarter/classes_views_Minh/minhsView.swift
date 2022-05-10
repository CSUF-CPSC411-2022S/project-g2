//
//  ContentView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/9/22.
//
import SwiftUI

 struct minhsView: View {
     @State private var showWebView = false

     var body: some View {
         GeometryReader { geometry in
             VStack {
                 HStack {
                     Text("Educational Modules")
                         .modifier(TitleTextModifier())
                 }.frame(height: geometry.size.height / 9)
                 ScrollView {
                     HStack {
                         NavigationLink(destination: Module1Button()) {
                             HStack{
                                 Image(systemName: "newspaper.circle")
                                 Text(modOne.0)
                             }
                             .modifier(ContentBoxModifier())
                         }
                     }
                     .frame(height: geometry.size.height / 9)
                     
                     HStack {
                         NavigationLink(destination: Module2Button()) {
                             HStack{
                                 Image(systemName: "newspaper.circle")
                                 Text(modTwo.0)
                             }
                             .modifier(ContentBoxModifier())
                         }
                     }.frame(height: geometry.size.height / 9)
                     
                     HStack {
                         NavigationLink(destination: Module3Button()) {
                             HStack{
                                 Image(systemName: "newspaper.circle")
                                 Text(modThree.0)
                             }
                             .modifier(ContentBoxModifier())
                             
                         }
                     }.frame(height: geometry.size.height / 9)
                     
                     HStack {
                         NavigationLink(destination: Module4Button()) {
                             HStack{
                                 Image(systemName: "newspaper.circle")
                                 Text("module 4")
                                 
                             }
                             .modifier(ContentBoxModifier())
                         }
                     }.frame(height: geometry.size.height / 9)
                     
                     HStack {
                         NavigationLink(destination: Module5Button()) {
                             HStack{
                                 Image(systemName: "newspaper.circle")
                                 Text("module 5")
                             }
                             
                                 .modifier(ContentBoxModifier())
                         }
                     }.frame(height: geometry.size.height / 9)
                     
                     HStack {
                         HStack{
                             Image(systemName: "newspaper.circle")
                             Button {
                                 showWebView.toggle()
                             } label: {
                                 Text("List of Hotlines")
                                     
                             }
                         }
                         .modifier(ContentBoxModifier())
                         .sheet(isPresented: $showWebView) {
                             Module6Button(url: URL(string: "https://www.pleaselive.org/hotlines/")!)
                         }
                     }.frame(height: geometry.size.height / 9)
                 }
             }
         }
         
     }
 }

struct minhsView_Previews: PreviewProvider {
    static var previews: some View {
        minhsView()
    }
}
