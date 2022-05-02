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
    @State var location: Bool = false
    
    @State var selectedContacts = [String]()
    @State var myContacts:[String:Int] = [
        "Nicholas Caro": 6266226475,
        "Wangmo Tezin": 9093784523,
        "Jeein Kim": 6269054065,
        "Minh Nguyen": 9093216756
    ]
    
    var body: some View {
//        NavigationView{
        VStack{
            Form{
                List{
                    // add footer to location sharing
                    Section(header: Text("LOCATION SENDER"), footer: location ? Text("Location will be included in message body") : Text("Location will not be included in message body")){
        //                Label("Share Current Location", systemImage: "location.circle")
        //                    .font(.title2)
        //                    .foregroundColor(location ? .red: .gray)
                        Toggle("location", isOn: $location)
                            .labelsHidden()
                            .tint(.red)
                    }
                    Section("CHOOSE YOUR CONTACT", content: {
                        NavigationLink(destination: {
                            chooseItems(myContacts: myContacts, selectedContacts: $selectedContacts).navigationTitle("Contact Picker")
                        }, label: {
                            HStack{
                                Text("Selected Contacts")
                                Spacer()
                                Image(systemName: "\(selectedContacts.count).circle")
                                    .foregroundColor(Color.red)
                                    .font(.title2)
                            }
                        })
                    })
                    
                    // Display the contacts chosen
                    Section("SELECTED CONTACT(S)", content: {
                        if (selectedContacts.count == 0){
                            Text("Nothing Selected Yet").font(.callout)
                        } else {
                            Text(selectedContacts.joined(separator: "\n"))
                        }
                            
                    })
                    
                    Section(header: Text("YOUR SITUATION")){
                        newGridView()
                        
                        
                    }
                    Button("Send Request") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    
                    .foregroundColor(.red)
                    .font(.body.bold())
                    
                }.navigationTitle("Help Request")
            }
         
        }

    

//        }
      

    }
    
    func sendMessage(){
        let sms: String = "sms:+19095393310&body=I'm being followed please FaceTime. me. I am at <LocationFunction()>"
        
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
    

    

}

struct chooseItems: View {
    @State var myContacts:[String:Int]
    
    @Binding var selectedContacts: [String]
    
    var body: some View {
        Form {
            List {
                ForEach(myContacts.keys.sorted(), id: \.self){
                    item in Button(action: {
                        withAnimation {
                            if self.selectedContacts.contains(item){
                                self.selectedContacts.removeAll(where: { $0 == item})
                            } else {
                                self.selectedContacts.append(item)
                            }
                        }
                    }){
                        HStack{
                            Image(systemName: "checkmark")
                                .opacity(self.selectedContacts.contains(item) ? 1.0 : 0.0)
                            Text(item)
                        }
                    }
                }
            }
        }
    }
}

struct MultiSelectPickerView: View {
    // The list of items we want to show
    @State var allItems: [String]

    // Binding to the selected items we want to track
    @Binding var selectedItems: [String]

    var body: some View {
        Form {
            List {
                ForEach(allItems, id: \.self) { item in
                    Button(action: {
                        withAnimation {
                            if self.selectedItems.contains(item) {
                                // Previous comment: you may need to adapt this piece
                                self.selectedItems.removeAll(where: { $0 == item })
                            } else {
                                self.selectedItems.append(item)
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "checkmark")
                                .opacity(self.selectedItems.contains(item) ? 1.0 : 0.0)
                            Text(item)
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}
struct nicksView_Previews: PreviewProvider {
    static var previews: some View {
        nicksView()
    }
}
