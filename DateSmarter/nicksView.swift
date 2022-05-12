//
//  nicksView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/20/22.
//

import SwiftUI
import MessageUI

struct ContactItem {
    let name: String
    let phone_number: Int
}

class Expenses: ObservableObject{
    @Published var items = [ContactItem]()
}

struct ContactView: View{
    @StateObject var expenses = Expenses()
    
    var body: some View{
        List{
            ForEach(expenses.items, id: \.name) { item in
                HStack{
                    Text(item.name)
                    Text(String(item.phone_number))
                }
                
            }
            .onDelete(perform: removeItems)
        }
        .navigationTitle("Contact Selecter")
        .toolbar {
            Button(action: {
                let expense = ContactItem(name: "Test", phone_number: 2132805798)
                expenses.items.append(expense)
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct nicksView: View {
    @State private var isShowingMessages = false
    @State var location: Bool = false
    @State var selectedContacts = [String]()
    @State var selectedContactsDict = [String: String]()
    @State var myContacts:[String:Int] = [
        "Nicholas Caro": 6266226475,
        "Wangmo Tenzing": 9093784523,
        "Jeein Kim": 6269054065,
        "Minh Nguyen": 9093216756
    ]
    // create a state object
    @StateObject var models = Model()
    @State var stringVar: String = ""
    @State var selectedGridItem: [messageButton] = []
    
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var finder: LocationTracking
    var rows: [GridItem] {
        Array(repeating: .init(.fixed(120)), count: 1)
    }

    var body: some View {
        VStack{
            Form{
                List{
                    // add footer to location sharing
                    Section(header: Text("Location Sender"), footer: location ? Text("Location sender on.") : Text("Location sender off.")){
                        
                        Toggle("location", isOn: $location)
                            .onChange(of: location){ value in
                                finder.find()
                                print("toggle checker")
                            }
                            .labelsHidden()
                            .tint(.red)
                    }
                    Section("Choose Contacts", content: {
                        NavigationLink(destination: {
                            chooseItems(myContacts: myContacts, selectedContacts: $selectedContacts, selectedContactsDict: $selectedContactsDict).navigationTitle("Contact Picker")
                        }, label: {
                            HStack{
                                Text("Selected Contacts")
                                Spacer()
                                Image(systemName: "\(selectedContactsDict.count).circle")
                                    .foregroundColor(Color.red)
                                    .font(.title2)
                            }
                        })
                    })
                    
                    // Display the contacts chosen
                    Section("Selected Contacts", content: {
                        if (selectedContactsDict.count == 0){
                            Text("Nothing Selected Yet").font(.callout)
                        } else {
                            ForEach(selectedContactsDict.keys.sorted(), id: \.self){
                                contact in
                                HStack{
                                    Image(systemName: "person.crop.circle").foregroundColor(.red).imageScale(.large)
                                    Text(contact)
                                }
                                
                            }
                            //                                Text(selectedContactsDict.keys.sorted().joined(separator: "\n"))
                            
                            
                        }
                        
                    })
                    
                    // Section that controls picking a situation
                    Section(header: Text("Pick a Situation")){
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHGrid(rows: rows, spacing: 40){
                                ForEach(models.responces){ item in
                                    newGridRow(item: item, items: $selectedGridItem)
                                }
                            }.navigationViewStyle(StackNavigationViewStyle())
                        }
                    }
                    
                    // Button that opens iMessage UI
                    Button {
                        self.isShowingMessages.toggle()
                 
                    } label: {
                        Text("Send Responce")
                    }
                    .sheet(isPresented: self.$isShowingMessages){
                        // convert array of contact to array of phone nummbers
                        
                        MessageUIView(recipients: $selectedContacts, location: $location, selectedGridItem: $selectedGridItem, selectedContactDict: $selectedContactsDict, completion: handleCompletion(_:))
                    }
                    .foregroundColor(.red)
                    .font(.body.bold())
                    
                }
                .navigationTitle("Help Request")
                .toolbar {
                    Button(action:{
                        viewModel.signOut()
                    }, label: {
                        HStack{
                            Image(systemName: "return").foregroundColor(.red)
                        }
                       
                        
                    })
                    .environmentObject(viewModel)
                }
            }
            
        }

        
    }
    
    func callFinder() -> Void{
        finder.find()
    }
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
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

struct chooseItems: View {
    @State var myContacts:[String:Int]
    
    @Binding var selectedContacts: [String]
    @Binding var selectedContactsDict: [String:String]
    
    var body: some View {
        Form {
            List {
                ForEach(myContacts.keys.sorted(), id: \.self){
                    contact in
                    
                    
                    Button(action: {
                        withAnimation {
                            if self.selectedContactsDict[contact] == nil { // if contact(key) is not in dictionary
//                                self.selectedContacts.append(contact)
                                self.selectedContactsDict[contact] = String(myContacts[contact]!)
                                print(selectedContactsDict)
                            } else {
//                                self.selectedContacts.removeAll(where: { $0 == contact})
                                self.selectedContactsDict.removeValue(forKey: contact)
                                print(selectedContactsDict)
                            }
                        }
                    }){
                        HStack{
                            Image(systemName: "checkmark")
//                                .opacity(self.selectedContacts.contains(contact) ? 1.0 : 0.0)
                                .opacity(self.selectedContactsDict[contact] != nil ? 1.0 : 0.0)
                            Text(contact)
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing){
                // Delete Button
                Button(action:{
                  // view to delete a contact
                }, label: {
                    Image(systemName: "person.crop.circle.badge.minus").foregroundColor(.red)
                })
                
                Spacer()
                
                Button(action:{
                  // view to add contact
                }, label: {
                    Image(systemName: "person.crop.circle.badge.plus").foregroundColor(.green)
                })
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

struct signOut: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View{
        
        Button(action: {
            viewModel.signOut()
        }, label: {
            Text("Sign Out")
                .foregroundColor(Color.red)
        })
        .environmentObject(viewModel)
    }
}

struct nicksView_Previews: PreviewProvider {
    static var previews: some View {
        nicksView(models: Model())
    }
}
