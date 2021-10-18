//
//  ViewController.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 15.10.2021.
//

import UIKit

typealias CompletionHandler =  (Bool, AnyObject?) -> Void


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        fetchStoriesByUsername()
        
    }


    func fetchStoriesByUsername() {
            let request = GetStoriesByUsernameRequest()
           
            NetworkApiClient().callApi(request: request) { (apiResponse) in
                if apiResponse.success {
                     print(apiResponse.data)
                } else {
                    print( apiResponse.message as AnyObject?)

                }
            }
        }
}

