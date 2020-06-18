//
//  WeatherDetailPresenter.swift
//  Evaluación Autofin México
//
//  Created by Pedro Cervantes on 16/06/20.
//  Copyright © 2020 Pedro Cervantes. All rights reserved.
//

import Foundation

protocol WeatherDetailView{
    func showWeatherSuccessful()
    func showWeatherFailure()
}

class WeatherDetailPresenter {
    
    private var weatherDetailView: WeatherDetailView?
    private var networkManager: RequestManager? = RequestManager()
    
    init(view: WeatherDetailView) {
        self.weatherDetailView = view
    }
    
    func retriveWeatherByCity(cityName: String){
        networkManager?.fetchWeather(cityName: cityName, completionHandler: { (response) in
            print(response)
        })
    }
}
