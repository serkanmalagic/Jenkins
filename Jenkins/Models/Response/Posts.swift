//
//  Posts.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 19.10.2021.
//

import Foundation

class Post: Codable {
    let userId, id: Int
    let title, body: String


    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
