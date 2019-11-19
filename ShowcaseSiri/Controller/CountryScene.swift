//
//  CountryScene.swift
//  ShowcaseSiri
//
//  Created by Arslan, Tolunay on 19.11.19.
//  Copyright © 2019 Arslan, Tolunay. All rights reserved.
//

import UIKit

class CountryScene: UITableViewController {
    
    var holidayDataSource = HolidayDataSource()
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        holidayDataSource.storeHolidaysFor(land: "De")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        holidayDataSource.listOfHolidays.count
    }

    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)

      return cell
    }
    
}

