//
//  Posts.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 19.10.2021.
//

import Foundation

struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

