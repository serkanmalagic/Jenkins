//
//  StoryRequest.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 18.10.2021.
//

import Foundation

class GetStoriesByUsernameRequest: ApiRequest<Story> {


    override func apiResource() -> String {
        return "todos/1"
    }

    override func requestType() -> HTTPMethod {
        return .get
    }

}
