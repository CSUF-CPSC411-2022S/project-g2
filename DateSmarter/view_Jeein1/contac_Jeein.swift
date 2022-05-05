//
//  contacts_Jeein.swift
//  DateSmarter
//
//  Created by Jeein Kim on 3/23/22.
//
import Foundation
import SwiftUI

struct Contacts: View {
    @State var people: [String] = ["Jeein Kim\n7144741825", "Nicholas Caro\n 9099366468", "Wango Tenzing\n2024761001", "Minh Nguyen\n5559087432"] // need to make this a data structure that can be passed to other views
    @State var others: [String] = ["Dr Paul Inventado\n7142039879", "Dr Anand Panangadan\n 7513339876"]
    @State var name: String = "Testing"
    var body: some View {

            List {
                Section(
                    header: Text("Favorites")) {
                        ForEach(people, id: \.self) { person in
                            Text(person)
                                .foregroundColor(Color.black)
                        }
                        .onDelete(perform: delete) //shortened these closure statements for clean code
                        .onMove(perform: move)
                        }
            }
                        .navigationTitle("Contacts")
                        .navigationBarItems(
                            leading: EditButton(),
                            trailing: AddButton)
                        .foregroundColor(Color.blue)
            
    }
                                            
                                            
    var AddButton: some View {
        Button("Add Contact", action: {
            add() //fix later
        })
    }
        
func delete(indexSet: IndexSet) {
        people.remove(atOffsets: indexSet)
    }

func move(indices:IndexSet, newOffset: Int) {
    people.move(fromOffsets: indices, toOffset: newOffset)
}

func add() {
        people.append("New Contact")
}
}
