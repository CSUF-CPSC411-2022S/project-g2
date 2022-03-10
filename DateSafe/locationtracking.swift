//
//  locationtracking.swift
//  DateSafe
//
//  Created by Wangmo Tenzing on 2/23/22.
//


import Foundation
import SwiftUI

//use LocationTracking() to call it from ContentView

struct LocationTracking {
    var latitude: Int = 45
    var longitude: Int = 100
    var coordinates: String = ""
    
    func trackLocation (_ latitude: Int, at longitude: Int) {
        if latitude >= 30 && latitude <= 50 {
            if longitude >= 70 && longitude <= 120 {
                print("📍Located detected in United States")
            }
        }
        else {
            print("Location is outside of United States")
        }
    }
}

/* struct LocationTracking_Previews: PreviewProvider {
    static var previews: some View {
        LocationTracking()
    }
} */
