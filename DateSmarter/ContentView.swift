//
//  ContentView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var NumberToMessage = ""
    @State var Message = ""
    
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("Im on a bad date") {
                    sendMessage()
                }
                .modifier(DateSmarter.buttonStyle())
                Spacer()
                Button("I feel trapped") {
                    sendMessage()
                }
                .modifier(DateSmarter.buttonStyle())
                Spacer()
                
                
            }
            HStack{
                Spacer()
                Button("I'm being followed") {
                    sendMessage()
                }
                .modifier(DateSmarter.buttonStyle())
                Spacer()
                Button("I've been drugged") {
                    sendMessage()
                }
                .modifier(DateSmarter.buttonStyle())
                Spacer()
                
                
            }
//            TextField("Enter A Mobile Number: ", text: $NumberToMessage)
//            TextField("Enter Your Message", text: $Message)
            
        }
    }
    
    func sendMessage(){
        let sms: String = "sms:+19095393310&body=I'm being followed please FaceTime. me. I am at <LocationFunction()>"
        
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct buttonStyle: ViewModifier {
   func body(content: Content) -> some View {
        content
           .padding()
           .accentColor(.white)
           .background(Color.accentColor)
           .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
   }
}



/*
 struct ContentView: View {
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
*/
