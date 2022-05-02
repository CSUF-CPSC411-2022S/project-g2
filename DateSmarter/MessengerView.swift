//
//  MessengerView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 4/29/22.
//

import SwiftUI
import UIKit
import MessageUI

struct MessengerView:  UIViewControllerRepresentable{
    
    @Binding var isShowing: Bool
    @Binding var result: Result<MessageComposeResult, Error>?

    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        
        @Binding var isShowing: Bool
        @Binding var result: Result<MessageComposeResult, Error>?

        
        init(isShowing: Binding<Bool>,
             result: Binding<Result<MessageComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
   
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            defer {
                isShowing = false
            }

            self.result = .success(result)
            controller.dismiss(animated: true, completion: nil)
            
            
           
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing, result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MessengerView>) -> MFMessageComposeViewController {
        let vc = MFMessageComposeViewController()
        vc.recipients = ["4085551212"]
        vc.body = "Hello from California!"
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController,
                                    context: UIViewControllerRepresentableContext<MessengerView>) {

        }
    
}

