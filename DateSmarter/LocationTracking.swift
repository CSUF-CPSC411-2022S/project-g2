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
   // let countryCode: String
    let region: String
    let regionName: String
    let city: String
    let zip: String
    let lat: Float
    let lon: Float
    let timezone: String
}

class LocationTracking: ObservableObject {
    
    //@published variables are only allowed with classes, not structs
    @Published var translatedQuery = ""
    //@Published var translatedStatus = ""
    @Published var translatedCountry = ""
    @Published var translatedRegion = ""
    @Published var translatedRegionName = ""
    @Published var translatedCity = ""
    @Published var translatedZip = ""
    
    func find() -> String {
//    closure: @escaping (String) -> Void
      
//        print("hello?")
        let ipUrl = "http://ip-api.com/json/"
        //addingPercentEncoding()
        if let urlString = ipUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
           let url = URL(string: urlString) {
//            print("hello2?")
            // Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
                let task = URLSession.shared.dataTask(with: url) {
                    data, response, error in
//                    print("hello3?")
                    DispatchQueue.main.async {
                        let jsonDecoder = JSONDecoder()
//                        print("hello4?")
                        //convert data into string
//                        print(data)
//                        print("Below will print out whole string received back from the API:")
//                        print(String(decoding:data!, as: UTF8.self))
                        // Decode the JSON and store in result
                        if let validData = data, let result = try? jsonDecoder.decode(Response.self, from: validData) {
//                            print("hello5?")
                            if result.query != " " {
                                self.translatedQuery = result.query
//                                print("hello6?")
                                self.translatedCountry = result.country
                                self.translatedRegion = result.region
                                self.translatedRegionName = result.regionName
                                self.translatedCity = result.city
                                self.translatedZip = result.zip
//                                print(self.translatedCity)
//                                print(self.translatedCountry)
//                                print(self.translatedZip)
//                                print(self.translatedRegionName)
//                                print(self.translatedRegion)
                                
                            }//if
                            else {
                            self.translatedQuery = "No results found."
                            }
                            
                        }//if
                        else {
                            self.translatedQuery = "No Results Found"
                        }//else
                    }//DispatchQueue
                }// let task = ...
            task.resume()
        }//let url = URL(string: urlString)
//        let text = "I am using Date Safer to send you my current location \(self.translatedCity)"
        return self.translatedCountry
//        return "I am using Date Safer to send you my current location \(self.translatedCity), \(self.translatedCountry), \(self.translatedZip), \(self.translatedRegionName), My coordinates: \(self.translatedQuery)"
    }//find func
}//class LocationTracking



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
 
 
 */ //end
 

//just previews, u can leave it commented out
/* struct LocationTracking_Previews: PreviewProvider {
    static var previews: some View {
        LocationTracking()
    }
}*/
