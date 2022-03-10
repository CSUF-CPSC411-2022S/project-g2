//
//  ViewController.swift
//  DateSafe
//
//  Created by Wangmo Tenzing on 2/23/22.
//

import UIKit
import SwiftUI


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

struct ContentView: View {
    @State private var isPressed = false
    @State private var displayPopup: Bool = false
    
    var body: some View {
        //If button has not been pressed, do nothing. If the button has been pressed, show the new image.
        Button(action: {
            /*DO STUFF HERE LATER*/
        }, label: {
            Image(!isPressed ? "alternative_test" : "test")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 400, alignment: .center)
                .clipShape(Circle())
                .overlay(ImageOverlay(), alignment: .center)
        })
            .buttonStyle(PlainButtonStyle()) //remove default highlight
            .pressAction { //Toggle effect
                isPressed = true
            } kReleased: {
                isPressed = false
            }
            .frame(width: 200, height: 200)
    }
}

//Background Dark
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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

extension View {
    func pressAction(kPressed: @escaping (()-> Void), kReleased: @escaping (() -> Void)) -> some View {
        modifier(PressActions(kPressed: {
            kPressed()
        }, kReleased: {
            kReleased()
        }))
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Will call Notifications and ContactOthers in here
    }
}



