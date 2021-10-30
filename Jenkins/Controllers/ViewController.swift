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
    
    var delegate : HomeViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadPosts()
        //loadPost()
        // loadPostComments()
        // loadUsers()
        let timer = ParkBenchTimer()
        print("The task took \(timer.stop()) seconds.")
    }
    @IBAction func pushVC(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewControllerSB") as? HomeViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func pushKeyVC(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "KeychainViewControllerSB") as? KeychainViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func testOverride(_ sender: Any) {
        
        class Car {
            var numberOfDoors = 0
            var description: String {
                return "\(numberOfDoors) door(s)"
            }
        }
        
        let car = Car()
        print("Car: \(car.description)")
        
        //  Bir üst initi baz alın ve üst sınıftaki değişkeni değiştirin.
        class Bus: Car {
            override init() {
                super.init()
                numberOfDoors = 4
            }
        }
        
        let bus = Bus()
        print("Bus: \(bus.description)")
        
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

