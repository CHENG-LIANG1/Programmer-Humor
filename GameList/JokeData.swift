//
//  JokeModel.swift
//  GameList
//
//  Created by 梁程 on 2021/10/18.
//

import Foundation

struct JokeListData: Decodable {
    var jokes: [JokeData]
}


struct JokeData: Decodable {
    var type: String
    var joke: String?
    var setup: String?
    var delivery: String?
}
