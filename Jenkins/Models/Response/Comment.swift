//
//  Comments.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 19.10.2021.
//

import Foundation

class Comment: Codable {
    let postID, id: Int
    let name, email, body: String

    init(postID: Int, id: Int, name: String, email: String, body: String) {
        self.postID = postID
        self.id = id
        self.name = name
        self.email = email
        self.body = body
    }
}
