//
//  HomeViewController.swift
//  ARSpace
//
//  Created by Tom Taulli on 8/25/17.
//  Copyright © 2017 Taulli's Taxes. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Moon", "Sun"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return planets.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
        
        cell.textLabel?.text = planets[indexPath.row]

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goPlanet" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let destinationVC = segue.destination as! ViewController
                
                destinationVC.planetFileName = planets[indexPath.row].lowercased() + ".jpg"
                
                destinationVC.planetTab = planets[indexPath.row]
                
            }
            
        }
        
    }

}
