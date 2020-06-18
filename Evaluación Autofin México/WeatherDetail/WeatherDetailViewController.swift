//
//  WeatherDetailViewController.swift
//  Evaluación Autofin México
//
//  Created by Pedro Cervantes on 16/06/20.
//  Copyright © 2020 Pedro Cervantes. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var weatherPresenter: WeatherDetailPresenter?
    public var cityName: String?
    
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherPresenter = WeatherDetailPresenter(view: self)
        weatherPresenter?.retriveWeatherByCity(cityName: self.cityName ?? "")
        self.view.backgroundColor = UIColor(red: 56/255.0, green: 110/255.0, blue: 185/255.0, alpha: 1.0)
        self.closeButton.tintColor = UIColor(red: 0/255.0, green: 20/255.0, blue: 20/255.0, alpha: 1)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension WeatherDetailViewController: WeatherDetailView {
    func showWeatherSuccessful() {
        print("Success")
    }
    
    func showWeatherFailure() {
        print("Failure")
    }
    
    
}
