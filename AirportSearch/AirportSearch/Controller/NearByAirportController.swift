//
//  NearByAirportController.swift
//  AirportSearch
//
//  Created by Naresh on 12/12/19.
//  Copyright © 2019 Naresh. All rights reserved.
//

import UIKit

//Missing - Plotting nearest airport on map due to time constraint
class NearByAirportController: UIViewController {

    var detailsViewModel:FetchAirportViewModel!
    var selectedAirport:AirportDetailModel!
    var nearByAirportList:[AirportDetailModel] = []
    @IBOutlet weak var nearByAirportTable: UITableView!
    @IBOutlet weak var selectedAirportLabel: UILabel!
    @IBOutlet weak var runwayLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.activityStartAnimating(activityColor: .darkGray, backgroundColor: .clear)
        containerView.isHidden = true
        nearByAirportTable.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        detailsViewModel.processNearByAirports(selectedAirport: selectedAirport)
        nearByAirportList = detailsViewModel.fiveNearestAirport
        setupSelectedAirport()
        nearByAirportTable.reloadData()
        containerView.isHidden = false
        nearByAirportTable.isHidden = false
        self.view.activityStopAnimating()
    }
    
    func setupSelectedAirport() {
        selectedAirportLabel.text = selectedAirport.code
        runwayLabel.text = selectedAirport.runway_length
        cityLabel.text = selectedAirport.city
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension NearByAirportController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nearByAirportList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Near By Airports"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nearByCell", for: indexPath) as! NearByAirportCell
        cell.airportCode.text = self.nearByAirportList[indexPath.row].code
        cell.city.text = self.nearByAirportList[indexPath.row].city
        cell.country.text = self.nearByAirportList[indexPath.row].country
        cell.state.text = self.nearByAirportList[indexPath.row].state
        cell.runway.text = self.nearByAirportList[indexPath.row].runway_length
        return cell
    }
}



