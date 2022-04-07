//
//  nicksView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/20/22.
//

import SwiftUI
import MessageUI

struct nicksView: View {
    @State var NumberToMessage = ""
    @State var Message = ""
    
    
    var body: some View {
        VStack{
            contactSelection()
            Divider()
            send_message_view()
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
