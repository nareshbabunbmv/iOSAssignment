//
//  NearByAirportController.swift
//  AirportSearch
//
//  Created by Naresh on 12/12/19.
//  Copyright © 2019 Naresh. All rights reserved.
//

import UIKit

class NearByAirportController: UIViewController {

    var detailsViewModel:FetchAirportViewModel!
    var selectedAirport:AirportDetailModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        detailsViewModel.processNearByAirports(selectedAirport: selectedAirport)
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
