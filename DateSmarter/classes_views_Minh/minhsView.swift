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
         NavigationView {
//             .navigationBarTitle("")
//             .navigationBarHidden(true)
//             .navigationBarBackButtonHidden(true)
             GeometryReader { geometry in
                 VStack {
                     HStack {
                         Text("Educational Modules")
                             .modifier(TitleTextModifier())
                     }.frame(height: geometry.size.height / 9)
                     ScrollView {
                         HStack {
                             NavigationLink(destination: Module1Button()) {
                                 Text(modOne.0)
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             NavigationLink(destination: Module2Button()) {
                                 Text(modTwo.0)
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             NavigationLink(destination: Module3Button()) {
                                 Text(modThree.0)
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             NavigationLink(destination: Module4Button()) {
                                 Text("module 4")
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             NavigationLink(destination: Module5Button()) {
                                 Text("module 5")
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
//                             NavigationLink(destination: Module6Button()) {
//                                 Text(modSix.0)
//                                     .modifier(ContentBoxModifier())
//                             }
                             
                             Button {
                                 showWebView.toggle()
                             } label: {
                                 Text("List of Hotlines")
                                     .modifier(ContentBoxModifier())
                             }
                             .sheet(isPresented: $showWebView) {
                                 Module6Button(url: URL(string: "https://www.pleaselive.org/hotlines/")!)
                             }
                         }.frame(height: geometry.size.height / 9)
                     }
                 }
             }
         }
     }
 }

