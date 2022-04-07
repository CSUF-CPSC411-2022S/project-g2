//
//  viewModifiers.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/20/22.
//

import Foundation
import SwiftUI

struct buttonMod: ViewModifier{
    func body(content: Content) -> some View {
        content
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(width: 220, height: 60)
        .background(Color.green)
        .cornerRadius(15.0)
    }
}
struct textFields: ViewModifier {
   func body(content: Content) -> some View {
        content
           .padding()
           .background()
           .cornerRadius(5.0)
           .font(.headline)
           .foregroundColor(Color.green)
           .padding(.bottom, 20)
    }
}




struct buttonStyle: ViewModifier {
   func body(content: Content) -> some View {
        content
           .padding()
           .accentColor(.white)
           .background(Color.accentColor)
           .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
   }
}
struct button_mod: ViewModifier {
   func body(content: Content) -> some View {
        content
           .frame(width: 320, height: 40)
           .font(.headline)
           .foregroundColor(Color.white)
           .background(Color.teal)
           .cornerRadius(15)
           
   }
}

struct LoginModifier: ViewModifier {

var borderColor: Color = Color.gray

func body(content: Content) -> some View {
    content
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .textContentType(.password)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1))
}
}


extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

extension Color {
  init?(_ hex: String) {
    var str = hex
    if str.hasPrefix("#") {
      str.removeFirst()
    }
    if str.count == 3 {
      str = String(repeating: str[str.startIndex], count: 2)
        + String(repeating: str[str.index(str.startIndex, offsetBy: 1)], count: 2)
        + String(repeating: str[str.index(str.startIndex, offsetBy: 2)], count: 2)
    } else if !str.count.isMultiple(of: 2) || str.count > 8 {
      return nil
    }
    let scanner = Scanner(string: str)
    var color: UInt64 = 0
    scanner.scanHexInt64(&color)
    if str.count == 2 {
      let gray = Double(Int(color) & 0xFF) / 255
      self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
    } else if str.count == 4 {
      let gray = Double(Int(color >> 8) & 0x00FF) / 255
      let alpha = Double(Int(color) & 0x00FF) / 255
      self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
    } else if str.count == 6 {
      let red = Double(Int(color >> 16) & 0x0000FF) / 255
      let green = Double(Int(color >> 8) & 0x0000FF) / 255
      let blue = Double(Int(color) & 0x0000FF) / 255
      self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    } else if str.count == 8 {
      let red = Double(Int(color >> 24) & 0x000000FF) / 255
      let green = Double(Int(color >> 16) & 0x000000FF) / 255
      let blue = Double(Int(color >> 8) & 0x000000FF) / 255
      let alpha = Double(Int(color) & 0x000000FF) / 255
      self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    } else {
      return nil
    }
  }
}
