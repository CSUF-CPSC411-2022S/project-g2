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
                             .modifier(TextModifier1())
                     }.frame(height: geometry.size.height / 9)
                     ScrollView {
                         HStack {
                             Text(modOne.0)  //the text displayed
                                 .modifier(TextModifier2())
                             NavigationLink(destination: Module1Button()) {
                                 Image(systemName: "arrow.turn.down.right")
                                     .modifier(ButtonDesign())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             Text(modTwo.0)
                             .modifier(TextModifier2())
                             NavigationLink(destination: Module2Button()) {
                                 Image(systemName: "arrow.turn.down.right")
                                     .modifier(ButtonDesign())
                                 
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             Text(modThree.0)
                             .modifier(TextModifier2())
                             NavigationLink(destination: Module3Button()) {
                                 Image(systemName: "arrow.turn.down.right")
                                     .modifier(ButtonDesign())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             Text("Module 4: ")
                             .modifier(TextModifier2())
                             NavigationLink(destination: Module4Button()) {
                                 Image(systemName: "arrow.turn.down.right")
                                     .modifier(ButtonDesign())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             Text("Module 5: ")
                             .modifier(TextModifier2())
                             NavigationLink(destination: Module5Button()) {
                                 Image(systemName: "arrow.turn.down.right")
                                     .modifier(ButtonDesign())
                             }
                         }.frame(height: geometry.size.height / 9)
                         
                         HStack {
                             Text(modSix.0)
                             .modifier(TextModifier2())
                             NavigationLink(destination: Module6Button()) {
                                 Image(systemName: "arrow.turn.down.right")
                                     .modifier(ButtonDesign())
                             }
                         }.frame(height: geometry.size.height / 9)
                     }
                 }
             }
         }
     }
 }

