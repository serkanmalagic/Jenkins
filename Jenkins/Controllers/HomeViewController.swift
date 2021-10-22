//
//  HomeViewController.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 22.10.2021.
//

import UIKit

protocol HomeViewControllerProtocol {
    func getAnotherRequest() -> String
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    func getAnotherRequest() -> String {
        NetworkClient.performRequest(vc: self, object: Post.self, router: APIRouter.getPost(id: "1"), success: { result in
        }) { (error) in
            print(error.localizedDescription)
        }
        
        return "lorem ipsum"
    }
    

}
