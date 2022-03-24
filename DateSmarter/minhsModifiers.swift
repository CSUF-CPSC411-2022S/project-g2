//
//  Modifiers.swift
//  DateSmarter
//
//  Created by csuftitan on 3/10/22.
//

import Foundation
import SwiftUI

struct Module1Button: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(modOne.0)
                    .font(.title)
                Text(modOne.1)
                    .font(.body)
            }
        }
    }
}
struct Module2Button: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(modTwo.0)
                    .font(.title)
                Text(modTwo.1)
                    .font(.body)
            }
        }
    }
}
struct Module3Button: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(modThree.0)
                    .font(.title)
                Text(modThree.1)
                    .font(.body)
            }
        }
    }
}
struct RoundedBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(10)
    }
}
struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(RoundedBackground())
            .foregroundColor(Color.white)
    }
}

struct TextModifier1: ViewModifier {
//custom modifier to allow for easy re-use
   func body(content: Content) -> some View {
        content
           .font(.custom("Trebuchet", size: 30))
           .foregroundColor(Color.white)
           .padding(25)
           .background(Color.cyan)
           .cornerRadius(10)
    }
}

struct TextModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Times New Roman", size: 20))
            .padding(10)
    }
}
