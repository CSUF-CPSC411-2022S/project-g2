//
//  views_Jeein.swift
//  DateSmarter
//
//  Created by Jeein Kim on 3/22/22.
//


import UIKit
import SwiftUI

//struct OnAppear: View {
//    @State var greeting: String = "Welcome "
//    var userName: String = "Paul"
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                Text(greeting)
//            }.onAppear(perform: {
//                greeting = "Location data has been successfully captured."
//            })
//        }
//    }
//
//
//}
//DateSafe Logo image overlay
struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("ds")
                .font(.custom("Times New Roman", size: 70))
                .padding(5)
                .foregroundColor(.white)
        }.background(Color.pink)
            .opacity(0.5)
            .cornerRadius(20)
            .padding(5)
    }
}

struct JContentView: View {
    @State private var isPressed = false
    @State private var displayPopup: Bool = false
    @State private var scale: CGFloat = 1


    var body: some View {
        Button(action: {
        //Call Location Function
            //print("Location sent")
            scale += 1
        }, label: {
            //Text("Location sent")
            Image("test1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200, alignment: .center)
                .clipShape(Circle())
                .overlay(ImageOverlay(), alignment: .center)
        })
            .scaleEffect(scale)
            .animation(.easeOut(duration: 3), value: scale)
            .buttonStyle(PlainButtonStyle()) //remove default highlight
//            .pressAction { //Toggle effect
//                isPressed = true
//            } kReleased: {
//                isPressed = false
//            }
            .frame(width: 200, height: 200)

    }
}

//Background Dark
struct JContentView_Previews: PreviewProvider {
    static var previews: some View {
        JContentView()
            .preferredColorScheme(.dark)
    }
}

//Press Actions
struct PressActions: ViewModifier {
    var kPressed: () -> Void
    var kReleased: () -> Void
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                //Ensure user doesn't accidentally click (must drag left or right)
                DragGesture(minimumDistance: 1.5)
                    .onChanged({ _ in
                        kPressed()
                    })
                    .onEnded({ _ in
                        kReleased()
                    })
                )
    }
}

//extension View {
//    func pressAction(kPressed: @escaping (()-> Void), kReleased: @escaping (() -> Void)) -> some View {
//        modifier(PressActions(kPressed: {
//            kPressed()
//        }, kReleased: {
//            kReleased()
//        }))
//    }
//}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Will call Notifications and ContactOthers in here
    }
}
