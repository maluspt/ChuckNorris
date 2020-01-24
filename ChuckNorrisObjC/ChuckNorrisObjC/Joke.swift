//
//  Joke.swift
//  ChuckNorrisObjC
//
//  Created by Maria Luiza Carvalho Sperotto on 23/01/20.
//  Copyright © 2020 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import Foundation

struct Joke: Codable {
    var value: String
    
    init(json: [String: Any]) {
        value = json["value"] as? String ?? ""
    }
}


