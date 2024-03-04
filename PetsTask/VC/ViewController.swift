//
//  ViewController.swift
//  PetsTask
//
//  Created by Abdullah Bin Essa on 3/4/24.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class PetsTableViewController: UITableViewController {
    
    
    var pets: [Pet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            fetchPetsData()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func fetchPetsData() {
        NetworkManager.shared.fetchPets { fetchedPets in
            DispatchQueue.main.async {
                self.pets = fetchedPets ?? []
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let pet = pets[indexPath.row]
        cell.textLabel?.text = pet.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let petDetailsVC = PetDetailsViewController()
        let pet = pets[indexPath.row]
        petDetailsVC.pets = pet
        
        navigationController?.pushViewController(petDetailsVC, animated: true)

    }
    
    
    
    


}

