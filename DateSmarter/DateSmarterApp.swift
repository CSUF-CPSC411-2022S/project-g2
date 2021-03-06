//
//  DateSmarterApp.swift
//  DateSmarter
//
//  Created by Nicholas Caro on 3/9/22.
//


import Firebase
import SwiftUI

@main
struct DateSmarterApp: App {
//    @StateObject var finder = LocationTracking()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            let finder = LocationTracking()
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(finder)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()

        
        return true
    }
}
