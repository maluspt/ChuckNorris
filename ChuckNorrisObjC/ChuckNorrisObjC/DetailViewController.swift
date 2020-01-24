//
//  DetailViewController.swift
//  ChuckNorrisObjC
//
//  Created by Maria Luiza Carvalho Sperotto on 23/01/20.
//  Copyright © 2020 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var joke = [Joke]()
    @objc var selectedCategory: String = ""
    
    @IBOutlet weak var jokeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parse()
    }
    
    @IBAction func reloadJoke(_ sender: UIButton) {
        parse()
    }
    
    
    func parse() {
        let urlString = "https://api.chucknorris.io/jokes/random?category=\(selectedCategory)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
            let joke = Joke(json: json)
            DispatchQueue.main.async {
                self.jokeLabel.text = joke.value
            }
        }.resume()
    }
}
