//
//  messageView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/24/22.
//

import SwiftUI
import MessageUI

struct messageView: View {
    @State private var isShowingMessages = false
    @State private var recipients = ["user 1", "user 2", "user 3"]
    @State private var message = "This is my awesome message to pass through."
    
    var body: some View {
        Button {
            self.isShowingMessages.toggle()
        } label: {
            Text("Show Messages")
        }
        .sheet(isPresented: self.$isShowingMessages){
            MessageUIView(recipients: $recipients, body: $message, completion: handleCompletion(_:))
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

//struct messageView_Previews: PreviewProvider {
//    static var previews: some View {
//        messageView()
//    }
//}
}
