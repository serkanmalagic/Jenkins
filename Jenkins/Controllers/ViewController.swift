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
        
       // loadPosts()
        loadPost()

        let a = APIRouter.getPost(id: "1")
        
    }
    
    
    func loadPosts() {
        
        NetworkClient.performRequest([MovieResponse].self, router: APIRouter.getPost(id: "1"), success: { (result) in
            
            for item in result {
                print(item.title)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    func loadPost(){
        NetworkClient.performRequest(Post.self, router: APIRouter.getPost(id: "1")) { result in
            print(result)
        } failure: { error in
            print(error.localizedDescription)
        }

    }

}

