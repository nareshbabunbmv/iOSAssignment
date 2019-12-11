//
//  FetchAirportViewModel.swift
//  AirportSearch
//
//  Created by Naresh on 11/12/19.
//  Copyright © 2019 Naresh. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreLocation

protocol ViewModelDelegate: class {
    func handleError(error:String)
    func load(allAirportDetails:[AirportDetailModel])
}

class FetchAirportViewModel {
    
    weak var delegate: ViewModelDelegate?
    var allAirportDetails:[AirportDetailModel] = [AirportDetailModel]()
    var fiveNearestAirport:[AirportDetailModel] = []
    
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
    
    //To sort and find out first five nearest airport to selected city
    func processNearByAirports(selectedAirport:AirportDetailModel) {
        let userLocation = CLLocation(latitude: Double(selectedAirport.lat)!, longitude: Double(selectedAirport.lon)!)
        
        let tempDetails = allAirportDetails
        
        let nearestDistanceDetails = tempDetails.sorted{
            let location$0 = CLLocation(latitude: Double($0.lat)!, longitude: Double($0.lon)!)
            let location$1 = CLLocation(latitude: Double($1.lat)!, longitude: Double($1.lon)!)
            return (location$0.distance(from: userLocation) < location$1.distance(from: userLocation))
        }
        fiveNearestAirport.append(contentsOf: nearestDistanceDetails[2...6])
    }
}
