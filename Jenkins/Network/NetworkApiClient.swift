//
//  NetworkApiClient.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 18.10.2021.
//

import UIKit
import Alamofire
import SwiftyJSON


class ApiResponse {
    var success: Bool!   // whether the API call passed or failed
    var message: String? // message returned from the API
    var data: AnyObject? // actual data returned from the API
    init(success: Bool, message: String? = nil, data: AnyObject? = nil) {
        self.success = success
        self.message = message
        self.data = data
    }
}


typealias ResponseHandler = (ApiResponse) -> Void

class NetworkApiClient {

    func callApi<ResponseType>(request: ApiRequest<ResponseType>, responseHandler: @escaping ResponseHandler) {

        let urlRequest = urlRequestWith(apiRequest: request)
        
        
        
        print(urlRequest)
        
        AF.request(urlRequest).responseData { (response) in
            print(response)
            switch(response.result) {
            case .success:
                let apiResponse = self.successResponse(request: request, response: response)
                responseHandler(apiResponse)
            case .failure:
                print(response)
            }
        }
    }

    func urlRequestWith<ResponseType>(apiRequest: ApiRequest<ResponseType>) -> URLRequest {
        let  completeUrl = apiRequest.webserviceUrl() + apiRequest.apiPath() +
            apiRequest.apiVersion() + apiRequest.apiResource() + apiRequest.endPoint()

        var urlRequest = URLRequest(url: URL(string: completeUrl)!)
        urlRequest.httpMethod = apiRequest.requestType().rawValue
        urlRequest.setValue(apiRequest.contentType(), forHTTPHeaderField:  "Content-Type")
        if apiRequest.bodyParams() != nil {
            urlRequest.httpBody = try?JSONSerialization.data(withJSONObject:  apiRequest.bodyParams()!, options: [])
        }
        return urlRequest
    }

    // here we are going to parse the data
        func successResponse<ResponseType: Codable>(request: ApiRequest<ResponseType>,
                                         response: AFDataResponse<Data>) -> ApiResponse{
            do {
                // Step 1
                let responseJson = try JSON(data: response.data!)
                // Step 2
                let dataJson = responseJson["data"].object
                let data = try JSONSerialization.data(withJSONObject: dataJson,
                                                      options: [])
                // Step 3
                let decodedValue = try JSONDecoder().decode(ResponseType.self, from: data)

                return ApiResponse(success: true, data: decodedValue as AnyObject)
                
            } catch {
                return ApiResponse(success: false)
            }
        }

}

