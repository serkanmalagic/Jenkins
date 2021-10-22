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
        
        //loadPosts()
       loadPost()
       // loadPostComments()
       // loadUsers()

    }
    
    
    func loadPost() {
        NetworkClient.performRequest(vc: self, object: Post.self, router: APIRouter.getPost(id: "1"), success: { result in
            print("loadPost çalıştı")
           // self.loadPosts()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func loadPosts(){
        NetworkClient.performRequest(vc: self, object:[Post].self, router: APIRouter.getPosts) { result in
            print("loadPosts çalıştı")
            self.loadPostComments()
        } failure: { error in
            print(error.localizedDescription)
        }
    }
    
    func loadPostComments(){
        NetworkClient.performRequest(vc: self, object:[Comment].self, router: APIRouter.getPostsComments(id: "1")) { result in
            print("loadPostComments çalıştı")
            self.loadUsers()
        } failure: { error in
            print(error.localizedDescription)
        }
    }
    
    func loadUsers(){
        NetworkClient.performRequest(vc: self, object:[User].self, router: APIRouter.getUsers) { result in
            print("loadUsers çalıştı")
        } failure: { error in
            print(error.localizedDescription)
        }

    }


}

