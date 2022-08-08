//
//  ViewController.swift
//  Json
//
//  Created by Денис Курлыков on 08.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let urlAddress = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }

    private func getData() {
        guard let url = URL(string: urlAddress) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let drink = try JSONDecoder().decode(Drinks.self, from: data)
                print(drink)
            } catch let error {
                print(error.localizedDescription)
            }

        }.resume()
    }
}

