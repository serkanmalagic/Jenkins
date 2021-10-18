//
//  Network.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 17.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiRequest<ResponseType: Codable> {

    func webserviceUrl() -> String {
        #if DEBUG
        return "https://jsonplaceholder.typicode.com/"
        #else
        return "https:www.medium.com/"
        #endif
    }

    func apiPath() -> String {
        return ""
    }

    func apiVersion() -> String {
        return ""
    }

    func apiResource() -> String {
        return ""
    }

    func endPoint() -> String {
        return ""
    }

    func bodyParams() -> NSDictionary? {
        return nil
    }

    func requestType() -> HTTPMethod {
        return .post
    }

    func contentType() -> String {
        return "application/json"
    }
}


public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
