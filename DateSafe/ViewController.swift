//
//  ViewController.swift
//  DateSafe
//
//  Created by Wangmo Tenzing on 2/23/22.
//

import UIKit
import SwiftUI

struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("ds")
                .font(.custom("Shelley", size: 70))
                .padding(5)
                .foregroundColor(.white)
        }.background(Color.pink)
            .opacity(0.5)
            .cornerRadius(20)
            .padding(5)
    }
}
struct ContentView: View {
    //This is necessary to have our button image, for views depend on specified states and are set on a case by case basis.
    @State private var isPressed = false
    
    var body: some View {
        //Checking the state of the isPressed property for a toggle effect.
        //If button has not been pressed, do nothing. If the button has been pressed, show the new image.
        Button(action: { }, label: {
            Image(!isPressed ? "alternative_test" : "test")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 380, height: 400, alignment: .center)
                .clipShape(Circle())
                .overlay(ImageOverlay(), alignment: .center)
        })
            .buttonStyle(PlainButtonStyle()) //remove default highlight
            .pressAction { //implementation of action from PressAction
                isPressed = true
            } kReleased: {
                isPressed = false
            }
            .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

//Press Actions for the Button
struct PressActions: ViewModifier {
    var kPressed: () -> Void
    var kReleased: () -> Void
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
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
        
        //createButton()
    }

//    func createButton() {
//        let button = UIButton(type: .system)
//        button.frame = CGRect(x:100, y:100, width:100, height:50)
//        button.backgroundColor = .darkGray
//        button.setTitle("Testing", for: .normal)
//
//        //button.addTarget(self, action: #selector(buttonAction),for: .touchUpInside)
//
//        self.view.addSubview(button)
//
//    }
}

