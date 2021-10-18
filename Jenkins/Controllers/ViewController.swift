//
//  ViewController.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 15.10.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRequest()
        
    }
    
    
    func loadRequest() {
        
        NetworkClient.performRequest([MovieResponse].self, router: APIRouter.getPosts, success: { (result) in
            
            for item in result {
                print(item.title)
            }
            
        }) { (error) in

            print(error.localizedDescription)
        }
        
    }
}

