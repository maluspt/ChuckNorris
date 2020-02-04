//
//  JokeView.swift
//  Chuck Norris
//
//  Created by Maria Luiza Carvalho Sperotto on 03/02/20.
//  Copyright © 2020 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import UIKit
import SnapKit

class JokeView: UIViewController {

    var selectedCategory = ""
    var button = UIButton()
    var jokeLabel = UILabel()
    let imageView = UIImageView(image: UIImage(named: "chucknorris.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        autoLayout()
        fetchData()
        
        button.addTarget(self, action: #selector(self.buttonPressed(sender:)), for: .touchUpInside)
        
        view.backgroundColor = .white
       
    }
    
    func setupViews() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange
        button.setTitle("Gimme MORE Chuck Norris", for: .normal)
        self.view.addSubview(button)
        
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        jokeLabel.text = ""
        jokeLabel.numberOfLines = 0
        jokeLabel.textAlignment = .center
        self.view.addSubview(jokeLabel)
       
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        
    }
    
    func autoLayout() {
        button.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-60)
            make.left.equalTo(self.view).offset(15)
            make.right.equalTo(self.view).offset(-15)
            make.width.equalTo(300)
            make.height.equalTo(90)
            make.centerX.equalTo(button)
        }
        
        jokeLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
            make.right.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(button)
            make.top.equalTo(self.view).offset(100)
            make.height.equalTo(250)
            make.width.equalTo(400)
        }
        
    }
    
    @objc func buttonPressed(sender: UIButton) {
        fetchData()
    }
    
    func fetchData() {
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


