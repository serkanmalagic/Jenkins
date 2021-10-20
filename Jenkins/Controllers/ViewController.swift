//
//  ViewController.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 15.10.2021.
//

import UIKit
import Alamofire
import SCLAlertView

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // loadPosts()
       // loadPost()
       // loadPostComments()
        loadUsers()
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
    
    func loadPostComments(){
        NetworkClient.performRequest([Comment].self, router: APIRouter.getPostsComments(id: "1")) { result in
            print(result)
        } failure: { error in
            print(error.localizedDescription)
        }
    }
    
    func loadUsers(){
        NetworkClient.performRequest([User].self, router: APIRouter.getUsers) { result in
            print(result)
        } failure: { error in
            print(error.localizedDescription)
        }

    }


}

