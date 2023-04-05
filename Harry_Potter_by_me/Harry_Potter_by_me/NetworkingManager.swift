//
//  NetworkingManager.swift
//  Harry_Potter_by_me
//
//  Created by Aigerim on 21.05.2022.
//

import Foundation
protocol NetworkManagerDelegate: AnyObject {
    func onHouseDidUpdate(with models: [HouseModel])
}

final class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    
func fetchHouses() {
    let urlString = "https://wizard-world-api.herokuapp.com/Houses"
    if let url = URL(string: urlString) {
        let urlRequest = URLRequest(url: url)
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            guard let safeData = data else {
                return }
            self.parseJSON (from: safeData)
        }
        task.resume()
    }
}
    
    private func parseJSON(from data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try
            decoder.decode([HouseModel].self, from: data)
            delegate?.onHouseDidUpdate(with: decodedData)
        } catch {
            print("Cathed some error: \(error)")
        }
    }
}

