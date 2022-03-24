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
             GeometryReader { geometry in
                 VStack {
                     VStack {
                         Text("Educational Modules")
                             .modifier(TextModifier1())
                         HStack {
                             Text("Module 1: ")  //the text displayed
                                 .modifier(TextModifier2())
                             NavigationLink(destination: Module1Button()) {
                                 Text(">>>")
                                     .bold()
                                     .modifier(ButtonDesign())
                             }
                         }.frame(height: geometry.size.height / 9)

                         HStack {
                             Text("Module 2: ")
                             .modifier(TextModifier2())
                             NavigationLink(destination: Module2Button()) {
                                 Text(">>>")
                                     .bold()
                                     .modifier(ButtonDesign())
                             }
                         }.frame(height: geometry.size.height / 9)

                         HStack {
                             Text("Module 3: ")
                             .modifier(TextModifier2())
                             NavigationLink(destination: Module3Button()) {
                                 Text(">>>")
                                     .bold()
                                     .modifier(ButtonDesign())
                             }
                         }.frame(height: geometry.size.height / 9)

                     }
                     Spacer()
                 }
             }
         }
     }
 }

