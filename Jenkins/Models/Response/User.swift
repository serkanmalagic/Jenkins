//
//  StarWars.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 20.10.2021.
//

import Foundation

// MARK: - WelcomeElement
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}
