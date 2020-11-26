//
//  ViewController+alertController.swift
//  Weather_API
//
//  Created by Николаев Никита on 04.11.2020.
//  Copyright © 2020 Николаев Никита. All rights reserved.
//

import UIKit

extension ViewController {
    func presentSearchAllertController (withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String)->Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { (tf) in
            let cities = ["Moscow", "San Francisco", "New York", "Kiev"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true)
        
    }
    
}
