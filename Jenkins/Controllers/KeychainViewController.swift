//
//  KeychainViewController.swift
//  Jenkins
//
//  Created by Serkan Mehmet Malagiç on 30.10.2021.
//

import UIKit

class KeychainViewController: UIViewController {

    @IBOutlet weak var keyText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func addKeychain(_ sender: Any) {
        let data = Data(from: keyText.text)
        let status = KeyChain.save(key: "myText", data: data)
        print("status: ", status)
    }
    
    @IBAction func getKeychain(_ sender: Any) {
        if let receivedData = KeyChain.load(key: "myText") {
            let result = receivedData.to(type: Int.self)
            print("result: ", result)
            let alert = UIAlertController(title: "Keychain got result", message: "result: \(result)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
}
