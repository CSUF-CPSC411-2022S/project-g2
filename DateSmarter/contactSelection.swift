//
//  contactSelection.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 4/6/22.
//

import SwiftUI

struct contactSelection: View {
    @State var selection = "Empty"
    let colors = ["Wango Tenzing", "Nicholas Caro", "Jeein Kim", "Minh Nguyen"]
    var body: some View {
        VStack {
            Text("Contact Selection")
            Text("Selected A Contact: \(selection)")
            Picker("Select a paint color", selection: $selection) {
                ForEach(colors, id: \.self) {
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
