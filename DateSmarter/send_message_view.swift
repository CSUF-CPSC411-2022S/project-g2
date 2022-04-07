//
//  send_message_view.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 4/6/22.
//

import SwiftUI

import MessageUI

struct send_message_view: View {
    
    @State private var isShowingMessages = false
    @State private var recipients = ["user 1", "user 2", "user 3"]
    @State private var message = "This is my awesome message to pass through."
    
    var body: some View {
        VStack{
            Button("I'M ON A BAD DATE") {
                self.isShowingMessages.toggle()
            }
            .modifier(button_mod())
            .sheet(isPresented: self.$isShowingMessages){
                MessageUIView(recipients: $recipients, body: $message, completion: handleCompletion(_:))
            }
            
            Button("I'M BEING FOLLOWED") {
                self.isShowingMessages.toggle()
            }
            .modifier(button_mod())
            .sheet(isPresented: self.$isShowingMessages){
                MessageUIView(recipients: $recipients, body: $message, completion: handleCompletion(_:))
            }
           
            Button("I'VE BEEN DRUGGED") {
                self.isShowingMessages.toggle()
            }
            .modifier(button_mod())
            .sheet(isPresented: self.$isShowingMessages){
                MessageUIView(recipients: $recipients, body: $message, completion: handleCompletion(_:))
            }
            
            Button("I FEEL TRAPPED") {
                self.isShowingMessages.toggle()
            }
            .modifier(button_mod())
            .sheet(isPresented: self.$isShowingMessages){
                MessageUIView(recipients: $recipients, body: $message, completion: handleCompletion(_:))
            }
        }
    }
    
    func handleCompletion(_ result: MessageComposeResult){
        switch result {
        case .cancelled:
            print("Cancle")
        break
            
        case .sent:
            print("Sent")
        break
            
        case .failed:
            print("failed")
        break
        
        @unknown default:
            print("unknown default")
        break
        }
        
    }
}

struct send_message_view_Previews: PreviewProvider {
    static var previews: some View {
        send_message_view()
    }
}
