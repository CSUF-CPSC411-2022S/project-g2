//
//  locationtracking.swift
//  DateSafe
//
//  Created by Wangmo Tenzing on 2/23/22.
//


import Foundation
import SwiftUI

//use LocationTracking() to call it from ContentView

struct LocationTracking: View {
    var latitude: Int = 45
    var longitude: Int = 100
    var coordinates: String = ""
    
    //once our parts are connected, we will
    
    var body: some View {
        VStack {
            HStack {
                Text("Starting Location Tracking...\n")
            } //HStack
            HStack {
                if latitude >= 30 && latitude <= 50 {
                    if longitude >= 70 && longitude <= 120 {
                        Text("📍Located detected")
                    }
                }
            }//HStack
        
        } //VStack
    }
}

struct LocationTracking_Previews: PreviewProvider {
    static var previews: some View {
        LocationTracking()
    }
}
