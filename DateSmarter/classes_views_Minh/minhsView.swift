//
//  ContentView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/9/22.
//

import SwiftUI

 struct minhsView: View {
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
                             NavigationLink(destination: Module1Button()) {
                                 Text(modTwo.0)
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             NavigationLink(destination: Module1Button()) {
                                 Text(modThree.0)
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             NavigationLink(destination: Module1Button()) {
                                 Text("module 4")
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             NavigationLink(destination: Module1Button()) {
                                 Text("module 5")
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             NavigationLink(destination: Module1Button()) {
                                 Text(modSix.0)
                                     .modifier(ContentBoxModifier())
                             }
                         }.frame(height: geometry.size.height / 9)
                     }
                 }
             }
         }
     }
 }

