//
//  AirportDetailModel.swift
//  AirportSearch
//
//  Created by Naresh on 11/12/19.
//  Copyright © 2019 Naresh. All rights reserved.
//

import UIKit
import SwiftyJSON

class AirportDetailModel {

    public var code : String
    public var lat : String
    public var lon : String
    public var name : String
    public var city : String
    public var state : String
    public var country : String
    public var woeid : String
    public var tz : String
    public var phone : String
    public var type : String
    public var email : String
    public var url : String
    public var runway_length : String
    public var elev : String
    public var icao : String
    public var direct_flights : String
    public var carriers : String
    
    init(data:JSON) {
        self.code = data[CODE].stringValue
        self.lat = data[LATTITIDE].stringValue
        self.lon = data[LONGITUDE].stringValue
        self.name = data[NAME].stringValue
        self.city = data[CITY].stringValue
        self.state = data[STATE].stringValue
        self.country = data[COUNTRY].stringValue
        self.woeid = data[WOEID].stringValue
        self.tz = data[TZ].stringValue
        self.phone = data[PHONE].stringValue
        self.type = data[TYPE].stringValue
        self.email = data[EMAIL].stringValue
        self.url = data[URL].stringValue
        self.runway_length = data[RUNWAY_LENGTH].stringValue
        self.elev = data[ELEV].stringValue
        self.icao = data[ICAO].stringValue
        self.direct_flights = data[DIRECT_FLIGHTS].stringValue
        self.carriers = data[CARRIERS].stringValue
    }
}
