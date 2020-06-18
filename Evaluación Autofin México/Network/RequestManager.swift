//
//  RequestManager.swift
//  Evaluación Autofin México
//
//  Created by Pedro Cervantes on 16/06/20.
//  Copyright © 2020 Pedro Cervantes. All rights reserved.
//

import Foundation

class RequestManager {
    
    func fetchWeather(cityName: String,completionHandler: @escaping ([String]) -> Void){
        
        let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=55dbb1b10e9f55181ad910227f1460ae&units=metric"
        let objectURL = URL(string: weatherURL)
        let task = URLSession.shared.dataTask(with: objectURL!, completionHandler: {(data,reponse,error)in
            if error != nil{
                print(error!)
            } else{
                do{
                    let json = try JSONDecoder().decode(CityWeatherInfo.self, from: data!)
                    print(json)
                } catch{
                    print("error")
                }
            }
        })
        task.resume()
    }
}
