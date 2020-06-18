//
//  ViewController.swift
//  Evaluación Autofin México
//
//  Created by Pedro Cervantes on 16/06/20.
//  Copyright © 2020 Pedro Cervantes. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var table: UITableView!
    
    var cities = ["Paris","Londres","Madrid","Seattle","Roma","Moscu","Dubai","Chicago","Singapur","HongKong","Tokio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self 
        
    }
    
}
    
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    //MARK: TableFunctions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return cities.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.cellImage.image = UIImage(named: cities[indexPath.row] + ".jpg")
        cell.cellLabel.text = cities[indexPath.row]
        
        return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let mainViewController = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as? WeatherDetailViewController else {
            return
        }
        let citiesID = cities[indexPath.row]
        mainViewController.cityName = citiesID
        self.present(mainViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ciudades del Mundo"
    }
}

