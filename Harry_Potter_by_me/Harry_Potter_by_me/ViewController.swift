//
//  ViewController.swift
//  Harry_Potter_by_me
//
//  Created by Aigerim on 21.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    let networkManager = NetworkManager()
    var houses: [HouseModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HarryHouseTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "harryHouseTableViewCell")
        networkManager.delegate = self
        networkManager.fetchHouses()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "harryHouseTableViewCell", for: indexPath) as! HarryHouseTableViewCell
        let houseModel = houses[indexPath.row]
        cell.configure(with: houseModel)
        return cell
    }
}

extension ViewController: NetworkManagerDelegate {
    
    func onHouseDidUpdate(with models: [HouseModel]) {
        houses = models
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
