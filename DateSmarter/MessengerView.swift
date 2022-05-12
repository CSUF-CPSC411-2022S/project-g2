//
//  MessengerView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 4/29/22.
//

import SwiftUI
import UIKit
import MessageUI

protocol MessagessViewDelegate{
    func messageCompletion(result: MessageComposeResult)
}

class MessagesViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    var delegate: MessagessViewDelegate?
    var recipients: [String]?
    var body: String?
  
    override func viewDidLoad() {
       
        super.viewDidLoad()
    }

    func displayMessageInterface(){
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self


        // Configure the fields of the interface
        composeVC.recipients = self.recipients ?? []
        composeVC.body = body ?? ""

        // Present the view controller modally.

        if MFMessageComposeViewController.canSendText(){
            self.present(composeVC, animated: true, completion: nil)
        } else {
            self.delegate?.messageCompletion(result: MessageComposeResult.failed)
        }
    }

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
        self.delegate?.messageCompletion(result: result)
    }
}

struct MessageUIView: UIViewControllerRepresentable{
    @Environment(\.presentationMode) var presentationMode
    @Binding var recipients: [String]
    @EnvironmentObject var finder: LocationTracking
    @Binding var location: Bool
    @Binding var selectedGridItem: [messageButton]
    @Binding var selectedContactDict: [String:String]

//    @Binding var location_string: String
    
    
    var completion: ((_ result: MessageComposeResult) -> Void)

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) ->  MessagesViewController {
        let intro_string = "I used the Date Smarter App to send this message."
        let controller = MessagesViewController()
        controller.delegate = context.coordinator
//        controller.recipients = recipients
        print("Message Auth View")
//        print(finder.translatedCity)
        let location_string = ". This is my location: \(finder.translatedCity), \(finder.translatedZip) \(finder.translatedCountry)"
        let numbers = selectedContactDict.values.sorted()
        print("Numbers:",  numbers)
        controller.recipients = numbers
        if (location){
            controller.body = intro_string + " " + selectedGridItem[0].body + location_string
        } else {
            controller.body = intro_string + " " + selectedGridItem[0].body
        }
        return controller
    }

    func updateUIViewController(_ uiViewController:  MessagesViewController, context: Context) {
        let intro_string = "I used the Date Smarter App to send this message."
        let location_string = ". This is my location: \(finder.translatedCity), \(finder.translatedZip) \(finder.translatedCountry)"
        let numbers = selectedContactDict.values.sorted()
        uiViewController.recipients = numbers
//        uiViewController.body = selectedGridItem[0].body
        if (location){
            uiViewController.body = intro_string + " " + selectedGridItem[0].body + location_string
        } else {
            uiViewController.body = intro_string + selectedGridItem[0].body
        }
        uiViewController.displayMessageInterface()
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, MessagessViewDelegate {
        var parent: MessageUIView

        init(_ controller: MessageUIView){
            self.parent = controller
        }

        func messageCompletion(result: MessageComposeResult) {
            self.parent.presentationMode.wrappedValue.dismiss()
            self.parent.completion(result)
        }
    }
}

