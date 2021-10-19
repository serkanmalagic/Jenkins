//
//  NetworkApiClient.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 18.10.2021.
//

import Foundation
import Alamofire

struct NetworkClient {
    
    typealias onSuccess<T> = ((T) -> ())
    typealias onFailure = ( (_ error: Error) -> ())
   
    // object parameter is added here so the T generic param can infer the type
    // All objects must conform to "Decodable" protocol
    static func performRequest<T>(_ object: T.Type, router: APIRouter, success: @escaping onSuccess<T>, failure: @escaping onFailure) where T: Decodable{
        AF.request(router)
            .debugLog()
            .responseJSON { (response) in
                print(response)
                do {
                    let Lists = try JSONDecoder().decode(T.self, from: response.data!)
                
                    success(Lists)
                } catch let error{
                    failure(error)
                }
            }
    }
}