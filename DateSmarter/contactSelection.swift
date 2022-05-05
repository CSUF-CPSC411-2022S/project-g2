//
//  contactSelection.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 4/6/22.
//

import SwiftUI

struct contactSelection: View {
    @State var selection = "Empty"
    let contact_list = ["Wango Tenzing", "Nicholas Caro", "Jeein Kim", "Minh Nguyen"]
    var responseMessages: [String: Int] = ["Wangmo Tenzing": 6266226475,
                            "Nicholas Caro": 6266226475,
                            "Jeein Kim": 6269054065,
                            "Minh Nguyen": 9093216756]
    var body: some View {
        VStack {
            Text("Contact Selection")
            Text("Selected A Contact: \(selection)")
            Picker("Select a paint color", selection: $selection) {
                ForEach(contact_list, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)

            
    }
    }
}


struct contactSelection_Previews: PreviewProvider {
    static var previews: some View {
        contactSelection()
    }
}
