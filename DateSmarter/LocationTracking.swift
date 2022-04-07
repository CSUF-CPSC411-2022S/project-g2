//
//  LocationTracking.swift
//  DateSmarter
//
//  Created by Wangmo Tenzing on 3/10/22.
//

import Foundation
import SwiftUI

//use LocationTracking() to call it from ContentView
struct LocationTracking {
    let url = "http://ip-api.com/json/"     //base URL
    getData(from: url)
}


private func getData(from url: String) {
//make API request here
let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
    guard let data = data, error == nil else {
        print("Something went wrong")
        return
    }
    //we now have the data
    //convert data to Response object
    
    var result: Response?
    do {
        result = try JSONDecoder().decode(Response.self, from: data)
    }
    catch {
        print("failed to convert \(error.localizedDescription)")
    }
    guard let json = result else {
        return
    }
    print(json.query)
    print(json.status)
    print(json.country)
    print(json.countryCode)
    print(json.region)
    
})
    task.resume()
    }
}

//response from API call
//No API key required

struct Response: Codable {
    let query: String
    let status: String
    let country: String
    let countryCode: String
    let region: String
    let regionName: String
    let city: String
    let zip: String
    let lat: Float
    let lon: Float
    let timezone: String
    let isp: String
    let org: String
    let AS: String
}


/* struct LocationTracking_Previews: PreviewProvider {
    static var previews: some View {
        LocationTracking()
    }
}*/
