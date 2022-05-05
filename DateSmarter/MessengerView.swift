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
//    @Binding var body: String
    @Binding var location: Bool
    @Binding var selectedGridItem: [messageButton]
    @Binding var selectedContactDict: [String:String]
    
    @State var searchString: String = ""
    @EnvironmentObject var finder: LocationTracking
    
    var completion: ((_ result: MessageComposeResult) -> Void)

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) ->  MessagesViewController {
        let controller = MessagesViewController()
        controller.delegate = context.coordinator
//        controller.recipients = recipients
        let numbers = selectedContactDict.values.sorted()
        let test_string = "test string"
        print("Numbers:",  numbers)
        controller.recipients = numbers
        if !location { // if user does not want to include there location in message body
            print(location)
            controller.body = selectedGridItem[0].body
        } else { // get location from API and concatinate it to message body
            print(location)
            finder.find(searchString)
            controller.body = test_string
        }
        
        
        return controller
    }

    func updateUIViewController(_ uiViewController:  MessagesViewController, context: Context) {
        let numbers = selectedContactDict.values.sorted()
        uiViewController.recipients = numbers
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

