//
//  AlertClass.swift
//  AirportSearch
//
//  Created by Naresh on 11/12/19.
//  Copyright © 2019 Naresh. All rights reserved.
//

import UIKit

class AlertClass {
    
    static let shared = AlertClass()
    
    func showAlert(withTitle title: String = "", andMessage message: String = "", inViewController viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertConstants.OK, style: .default){(action:UIAlertAction) in}
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}

