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

////  Person serkan tarafından inherit edilmeye çalışılıyor fakat "final" bunu engeller
//final class Person{
//
//    let name : String
//
//    internal init(name: String) {
//        self.name = name
//    }
//}
//
//class Serkan: Person {
//    let id : UUID
//}
class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    //  Property observer olarak değer içerisine parametre alarak onunla ilgili işlemler yapabilir
    var closureExample = {  ( text : String ) in
        print("i got the variable. Variable is \(text)")
    }
    
    //  Property observer olarak değer içerisine parametre alarak onunla ilgili işlemler yapabilir
    var score = 0 {
        didSet{
            print("updated value is \(score)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        score = 6
    }
    
    
    func getAnotherRequest() -> String {
        
        NetworkClient.performRequest(vc: self, object: Post.self, router: APIRouter.getPost(id: "1"), success: { result in
        }) { (error) in
            print(error.localizedDescription)
        }
        
        return "lorem ipsum"
    }

}
