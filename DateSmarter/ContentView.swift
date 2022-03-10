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
        let sms: String = "sms:+16266226475&body=This is a test."
        
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


