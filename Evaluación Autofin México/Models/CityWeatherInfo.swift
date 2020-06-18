//
//  CityWeatherInfo.swift
//  Evaluación Autofin México
//
//  Created by Pedro Cervantes on 17/06/20.
//  Copyright © 2020 Pedro Cervantes. All rights reserved.
//

import Foundation

struct CityWeatherInfo: Decodable {
    var name: String
    var main: Main?
    var weathers: [Weather]?
    
    private enum CodingKeys: String, CodingKey {
        case weathers = "weather"
        case main = "main"
        case name
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.main = try container.decode(Main.self,forKey: .main)
        self.weathers = try container.decode([Weather].self,forKey: .weathers)
    }
}

struct Weather: Decodable {
    var main: String?
    var description: String?
    
    private enum WeatherKeys: String, CodingKey {
        case main
        case description
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WeatherKeys.self)
        self.main = try container.decode(String.self,forKey: .main)
        self.description = try container.decode(String.self,forKey: .description)
    }
}

struct Main: Decodable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    
    private enum MainKeys: String, CodingKey {
        case temp
        case feels_like
        case temp_min
        case temp_max
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MainKeys.self)
        self.temp = try container.decode(Double.self, forKey: .temp)
        self.feels_like = try container.decode(Double.self, forKey: .feels_like)
        self.temp_min = try container.decode(Double.self, forKey: .temp_min)
        self.temp_max = try container.decode(Double.self, forKey: .temp_max)
    }
}
