//
//  newGridView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 5/1/22.
//

import SwiftUI

class messageButton: Identifiable {
    var label: String
    var body: String
    var icon: Image
//    Image(systemName: "exclamationmark.bubble.fill")
    
    init(label: String, body: String, icon: Image){
        self.label = label
        self.body = body
        self.icon = icon
    }
    
    
}

struct newGridView: View {
    @State var messageButtons = [
        messageButton(label: "On a Bad Date", body: "Can you please call me? I need to get out of this bad date", icon: Image(systemName: "person.2.circle") ),
        messageButton(label: "Being Followed", body: "I am being followed. Please call me ASAP.", icon: Image(systemName: "eye.circle") ),
        messageButton(label: "Feeling \n Trapped", body: "I am with someone that is making feel trapped. Please call me.", icon: Image(systemName: "dot.square") ),
        messageButton(label: "Drugged \n", body: "I think I was drugged. Please call me. ", icon: Image(systemName: "pills.circle"))
    ]
    
    @State var selectedItem: [messageButton] = [] // array of type messageButton to store the selected GridItem
    
    var newRows: [GridItem] {
        Array(repeating: .init(.fixed(120)), count: 1)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: newRows, spacing: 40){
                ForEach(messageButtons){ item in
                    Button(action: {},
                           label: {
                        VStack{
                            item.icon
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(item.label)
                                .font(.body.bold())
                        }
                    })
                    .padding()
                    .frame(width: 120, height: 140)
                    
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
            }.navigationViewStyle(StackNavigationViewStyle())
        }
        
        
    }
}

struct newGridRow: View {
    var body: some View {
        Text("Hello World")
    }
}

struct newGridView_Previews: PreviewProvider {
    static var previews: some View {
        newGridView()
    }
}
