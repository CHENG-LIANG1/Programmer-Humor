//
//  JokeModel.swift
//  GameList
//
//  Created by 梁程 on 2021/10/18.
//

import UIKit


class JokeModel: NSObject, NSCoding {
    
    var jokeContent: String?
    var isFavorated: Bool?
    
    init(content: String, isFav: Bool){
        self.jokeContent = content
        self.isFavorated = isFav
    }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(jokeContent, forKey: "joke")
        coder.encode(isFavorated, forKey: "isFav")
    }
    
    required init?(coder: NSCoder) {
        self.jokeContent = coder.decodeObject(forKey: "joke") as? String
        self.isFavorated = coder.decodeObject(forKey: "isFav") as? Bool
    }
    
    
}
