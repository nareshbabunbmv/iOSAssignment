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
    @IBOutlet weak var airportListTable: UITableView!

    override func viewDidLoad() {
        self.airportListTable.isHidden = true
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
        self.view.activityStopAnimating()
        self.allAirportDetails.removeAll()
        self.allAirportDetails.append(contentsOf: allAirportDetails)
        //load the list once received all the details of the airport
        if self.allAirportDetails.count != 0 {
            self.airportListTable.isHidden = false
            self.airportListTable.reloadData()
        }
    }
}

extension AirportSearchController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allAirportDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! AirportDetailCell

        cell.airportCode.text = self.allAirportDetails[indexPath.row].code
        cell.city.text = self.allAirportDetails[indexPath.row].city
        cell.country.text = self.allAirportDetails[indexPath.row].country
        cell.state.text = self.allAirportDetails[indexPath.row].state
        
        return cell
        
    }
}
