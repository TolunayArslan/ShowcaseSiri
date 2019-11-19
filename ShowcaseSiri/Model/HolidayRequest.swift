//
//  HolidayRequest.swift
//  ShowcaseSiri
//
//  Created by Arslan, Tolunay on 19.11.19.
//  Copyright © 2019 Arslan, Tolunay. All rights reserved.
//

import Foundation

enum HolidayError: Error {
    case noDataAvailable
    case canNotProcessData
    // Implement different api error codes
}

struct HolidayRequest {
    
    let API_KEY = ""
    let requestURL: URL
    
    init(countryCode: String) {
        
        // get current date
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        let resourceString = "https://calendarific.com/api/v2/holidays?&api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.requestURL = resourceURL
        
    }
    
    // actuall request
    // going to be our api request
       func getHolidays (completion: @escaping(Result<[HolidayDetail], HolidayError>) -> Void) {
           
           let dataTask = URLSession.shared.dataTask(with: requestURL) {data, _, _ in
               
               guard let jsonData = data else {
                   completion(.failure(.noDataAvailable))
                   print("No data available")
                   return
               }
               
               do {
                   let decoder = JSONDecoder()
                   let holidayReponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                   
                   let holidayDetails = holidayReponse.response.holidays // array we are looking for
                   completion(.success(holidayDetails))
                    print("Roked")
                   
               } catch {
                   completion(.failure(.canNotProcessData))
               }
           }
           dataTask.resume()
           
       }
    
}



