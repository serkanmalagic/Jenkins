//
//  Constants.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 17.10.2021.
//

import Foundation

struct Constants {
    static let baseURL = "https://jsonplaceholder.typicode.com/"
}


enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded; charset=utf-8"
    case accept = "*/*"
    case acceptEncoding = "gzip;q=1.0, compress;q=0.5"
}
