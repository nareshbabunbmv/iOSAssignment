//
//  WebAPI.swift
//  AirportSearch
//
//  Created by Naresh on 11/12/19.
//  Copyright © 2019 Naresh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WebAPI: NSObject {
    
    static let shared = WebAPI()
    
    func getAirportDetails(completionHandler: @escaping (AnyObject?,Bool) -> ()) {
        Alamofire.request( URL_FETCH_AIRPORT, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HTTPHeaders()).responseJSON { response in
                switch response.result {
                    case .success(let data):
                    completionHandler(JSON(data as Any) as AnyObject, true)
                    case .failure(let failureError):
                    completionHandler( failureError.localizedDescription as AnyObject,false)
            }
        }
    }
}
