//
//  Holidays.swift
//  ShowcaseSiri
//
//  Created by Arslan, Tolunay on 19.11.19.
//  Copyright © 2019 Arslan, Tolunay. All rights reserved.
//

import Foundation

struct HolidayResponse: Decodable {
    var response: Holidays
}

struct Holidays: Decodable {
    var holidays: [HolidayDetail]
}

struct HolidayDetail: Decodable {
    var name: String
    var date: DatumDetail
}

struct DatumDetail: Decodable {
    var iso: String
}


