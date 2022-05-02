//
//  gridView.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 4/30/22.
//

import SwiftUI

enum Items: String, CaseIterable, Equatable {
    case item1
    case item2
    case item3
    case item4
    case item5
    case item6
}





struct gridView: View {
    
    
//    @State var messageButtons = [
//        messageButton(label: "On a Bad Date", body: "Can you please call me? I need to get out of this bad date", icon: "❌👨🏻‍❤️‍💋‍👨🏽" ),
//        messageButton(label: "Being Followed", body: "Can you please call me? I need to get out of this bad date", icon: "👀" ),
//        messageButton(label: "Feeling Trapped", body: "Can you please call me? I need to get out of this bad date", icon: "🪤" ),
//        messageButton(label: "Drugged", body: "Can you please call me? I need to get out of this bad date", icon: "💊")
//    ]
    
    
    var rows: [GridItem] {
        Array(repeating: .init(.fixed(120)), count: 1)
    }
    
    @State var selectedItems: [Items] = []
    
//    @State var selectedItem: [messageButton] = [] // array of type messageButton to store the selected GridItem
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(Items.allCases, id: \.self) { item in
                    GridRow(item: item, items: $selectedItems)
                }
            }  .navigationViewStyle(StackNavigationViewStyle())
        }
        
        
        
    }
}


struct GridRow: View {
    let item: Items
    
    @Binding var items: [Items]
    
    
    var body: some View {
        Button(action: {
            if items.contains(item){
                items.removeAll { $0 == item}
            } else {
                items.append(item)
            }
        }, label: {
            
            Text(item.rawValue)
                .tag(item)
                .foregroundColor(.white)
                .font(.body.bold())
        })
        .padding()
        .frame(width: 150, height: 100)
   
        .background(items.contains(item) ? LinearGradient(gradient: Gradient(colors: [Color.red]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.gray]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(20)
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))



        
    }
}
struct gridView_Previews: PreviewProvider {
    static var previews: some View {
        gridView()
            .previewInterfaceOrientation(.portrait)
    }
}
