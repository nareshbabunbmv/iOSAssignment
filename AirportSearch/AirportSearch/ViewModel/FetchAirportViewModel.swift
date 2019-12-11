//
//  FetchAirportViewModel.swift
//  AirportSearch
//
//  Created by Naresh on 11/12/19.
//  Copyright © 2019 Naresh. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol ViewModelDelegate: class {
    func handleError(error:String)
    func load(allAirportDetails:[AirportDetailModel])
}

class FetchAirportViewModel {
    
    weak var delegate: ViewModelDelegate?
    var allAirportDetails:[AirportDetailModel] = [AirportDetailModel]()
    
    func getAllAirportDetails() {
        self.allAirportDetails.removeAll()
        WebAPI.shared.getAirportDetails { (data, status) in
            if status == true {
                let jsonData = data as! JSON
                if let responseArray = jsonData.array {
                    for object in responseArray {
                        let airportDetail = AirportDetailModel(data: object)
                        self.allAirportDetails.append(airportDetail)
                    }
                }
                self.delegate?.load(allAirportDetails: self.allAirportDetails)
            } else {
                self.delegate?.handleError(error: data as! String)
            }
        }
    }
}
