//
//  newGridView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 5/1/22.
//

import SwiftUI

struct messageButton: Decodable, Identifiable{
    private(set) var id = UUID()
    var label: String
    var body: String
    var icon: String

    init(label: String, body: String, icon: String){
        self.label = label
        self.body = body
        self.icon = icon
    }
}

class Model: ObservableObject{
    @Published var responces = [messageButton]() // array of messageButton objects
    @Published var selectedItemOne: [messageButton] // array to old selected responce boxes
    
    init(){
        
        
        // json way
//         self.responces = load("responcesData.json") gives an error
        self.responces =  [
            messageButton(label: "On a Bad Date", body: "Can you please call me? I need to get out of this bad date", icon: "person.2.circle" ),
            messageButton(label: "Being Followed", body: "I am being followed. Please call me ASAP.", icon: "eye.circle" ),
            messageButton(label: "Feeling \n Trapped", body: "I am with someone that is making feel trapped. Please call me.", icon: "dot.square"),
            messageButton(label: "Drugged \n", body: "I think I was drugged. Please call me. ", icon: "pills.circle")
        ]
        self.selectedItemOne = [
            ]
//        loadData()
        
    }
    
    func loadData()  {
           guard let url = Bundle.main.url(forResource: "responcesData", withExtension: "json")
               else {
                   print("Json file not found")
                   return
               }
           
           let data = try? Data(contentsOf: url)
           let responces  = try? JSONDecoder().decode([messageButton].self, from: data!)
           self.responces = responces!
        print(self.responces)
           
       }
    

}

struct newGridRow: View {
    let item: messageButton
    
    @Binding var items: [messageButton]
    
    var body: some View {
        Button(action : {
            if items.contains(where: {$0.id == item.id}){
                items.removeAll(where: {$0.id == item.id})
            } else {
                items.append(item)
                print(items)
            }
            
        }, label: {
            VStack{
                Image(systemName: item.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(item.label)
                    .font(.body.bold())
            }
        })
        .padding()
        .frame(width: 120, height: 140)
        .foregroundColor(.white)
        .background(items.contains(where: {$0.id == item.id}) ? LinearGradient(gradient: Gradient(colors: [Color.red]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.black]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(20)
    }
}




