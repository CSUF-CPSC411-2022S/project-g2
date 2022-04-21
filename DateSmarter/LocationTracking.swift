//
//  LocationTracking.swift
//  DateSmarter
//
//  Created by Wangmo Tenzing on 3/10/22.
//

import Foundation
import SwiftUI


struct Response: Codable {
    
    //response from API call
    //No API key required
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

class LocationTracking {
    
    //@published variables are only allowed with classes, not structs
    @Published var translatedQuery = ""
    @Published var translatedStatus = ""
    @Published var translatedCountry = ""
    
    
    let ipUrl = "http://ip-api.com/json/"
    
    func find(_ searchString: String) {
        guard searchString != "" else {
            return
        }
    //addingPercentEncoding()
    if let urlString = ipUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
        let url = URL(string: urlString) {
        
        // Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            DispatchQueue.main.async {
                let jsonDecoder = JSONDecoder()
                // Decode the JSON and store in result
                if let validData = data, let result = try? jsonDecoder.decode(Response.self, from: validData) {
                    
                    //testing to see if IP address starts with 1...but right now, it just is testing to see if it is == 1
                    if result.query == "1" {
                        self.translatedQuery = result.query
                    }//if
                    else {
                        self.translatedQuery = "No Results Found"
                    }//else
                }
                else {
                    self.translatedQuery = "No Results Found"
                }//else
            }
            task.resume()
        }
    }//let url = URL(string: urlString)
        

/*

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
 
 
 */   // end of my actual code
 
 
 

//just previews, u can leave it commented out
/* struct LocationTracking_Previews: PreviewProvider {
    static var previews: some View {
        LocationTracking()
    }
}*/
