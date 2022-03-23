//
//  nicksView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/20/22.
//

import SwiftUI

struct nicksView: View {
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

struct nicksView_Previews: PreviewProvider {
    static var previews: some View {
        nicksView()
    }
}
