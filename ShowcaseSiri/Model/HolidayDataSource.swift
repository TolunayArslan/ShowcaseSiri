//
//  CountryDataSource.swift
//  ShowcaseSiri
//
//  Created by Arslan, Tolunay on 19.11.19.
//  Copyright © 2019 Arslan, Tolunay. All rights reserved.
//

import Foundation

class HolidayDataSource {
    
    var listOfHolidays: [String : [HolidayDetail] ] = [:]
    
    func storeHolidaysFor(land landkürzel: String) {
        
        let holidayReq = HolidayRequest(countryCode: landkürzel)
        
        holidayReq.getHolidays { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let holidays):
                
                self?.listOfHolidays[landkürzel] = holidays
            }
        }
    }
    
    func getHolidayDetailsFor(land landkürzel: String) -> [HolidayDetail] {
        listOfHolidays[landkürzel]!
    }
    
    
    
}
