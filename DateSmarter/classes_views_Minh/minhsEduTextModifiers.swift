//
//  minhsEduTextModifiers.swift
//  DateSmarter
//
//  Created by csuftitan on 4/6/22.
//
import Foundation
import SwiftUI
import WebKit

struct Module1Button: View {
    var body: some View {
//        NavigationView {
//            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Text(modOne.0)
                            .font(.largeTitle)
                        Text(modOne.1)
                            .font(.body)
                        Text(modOne.2)
                            .font(.body)
                        Text(modOne.3)
                            .font(.body)
                        Text(modOne.4)
                            .font(.body)
                        Text(modOne.5)
                            .font(.body)
                        Text(modOne.6)
                            .font(.body)
                        Text(modOne.7)
                            .font(.body)
                        Text(modOne.8)
                            .font(.body)
//                    }.frame(height: geometry.size.height / 16)
                }
            }
//        }
    }
}

struct Module2Button: View {
    var body: some View {
        ScrollView {
            VStack {
                Text(modTwo.0)
                    .font(.largeTitle)
                Text(modTwo.1)
                    .font(.body)
                Text(modTwo.2)
                    .font(.title2)
                Text(modTwo.3)
                    .font(.body)
                Text(modTwo.4)
                    .font(.title2)
                Text(modTwo.5)
                    .font(.body)
                Text(modTwo.6)
                    .font(.title2)
                Text(modTwo.7)
                    .font(.body)
                Text(modTwo.8)
                    .font(.title2)
                Text(modTwo.9)
                    .font(.body)
            }
        }
    }
}
struct Module3Button: View {
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text(modThree.0)
                        .font(.largeTitle)
                    Text(modThree.1)
                        .font(.title2)
                    Text(modThree.2)
                        .font(.body)
                    Text(modThree.3)
                        .font(.title2)
                    Text(modThree.4)
                        .font(.body)
                    Text(modThree.5)
                        .font(.title2)
                    Text(modThree.6)
                        .font(.body)
                    Text(modThree.7)
                        .font(.title2)
                    Text(modThree.8)
                        .font(.body)
                    Text(modThree.9)
                        .font(.title2)
                }
                Group {
                    Text(modThree.10)
                        .font(.body)
                    Text(modThree.11)
                        .font(.title2)
                    Text(modThree.12)
                        .font(.body)
                    Text(modThree.13)
                        .font(.title2)
                    Text(modThree.14)
                        .font(.body)
                    Text(modThree.15)
                        .font(.title2)
                    Text(modThree.16)
                        .font(.body)
                    Text(modThree.17)
                        .font(.title2)
                    Text(modThree.18)
                        .font(.body)
                    Text(modThree.19)
                        .font(.title2)
                }
                Group {
                    Text(modThree.20)
                        .font(.body)
                    Text(modThree.21)
                        .font(.title2)
                    Text(modThree.22)
                        .font(.body)
                    Text(modThree.23)
                        .font(.title2)
                    Text(modThree.24)
                        .font(.body)
                    Text(modThree.25)
                        .font(.title2)
                    Text(modThree.26)
                        .font(.body)
                }
            }
        }
    }
}
struct Module4Button: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(modFour.0)
                    .font(.title)
                Text(modFour.1)
                    .font(.body)
            }
        }
    }
}
struct Module5Button: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(modFive.0)
                    .font(.title)
                Text(modFive.1)
                    .font(.body)
            }
        }
    }
}
//struct Module6Button: View {
//    @Environment(\.openURL) var openURL
//    var body: some View {
//        VStack {
//            Button("List of Hotlines") {
//                openURL(URL(string: "https://www.pleaselive.org/hotlines/")!)
//            }
//        }
//    }
//
//}

//source
//https://www.appcoda.com/swiftui-wkwebview/
struct Module6Button: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
