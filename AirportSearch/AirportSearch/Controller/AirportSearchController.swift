//
//  ViewController.swift
//  AirportSearch
//
//  Created by Naresh on 11/12/19.
//  Copyright © 2019 Naresh. All rights reserved.
//

import UIKit

class AirportSearchController: UIViewController,ViewModelDelegate {
    
    var allAirportDetails:[AirportDetailModel] = [AirportDetailModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.view.activityStartAnimating(activityColor: .darkGray, backgroundColor: .clear)
        let detailsViewModel = FetchAirportViewModel()
        detailsViewModel.delegate = self
        detailsViewModel.getAllAirportDetails()
    }
    
    func handleError(error: String) {
        self.view.activityStopAnimating()
        //ShowAlertMessage
        AlertClass.shared.showAlert(withTitle: error, inViewController: self)
    }
    
    func load(allAirportDetails: [AirportDetailModel]) {
        self.allAirportDetails.removeAll()
        self.allAirportDetails.append(contentsOf: allAirportDetails)
        //load the list once received all the details of the airport
    }
}

