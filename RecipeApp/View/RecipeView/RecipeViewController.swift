//
//  RecipeViewController.swift
//  RecipeApp
//
//  Created by Varun Sharma on 17/11/23.
//

import UIKit

class RecipeViewController: UIViewController {

    
    
    @IBOutlet weak var recipeLabel: UILabel!
    
    @IBOutlet weak var recipeText: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("running")
        
       
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    
        recipeLabel.text = "Dosa"
        recipeText.text = "DosaDosaDosa DosaDosaDosaDosa Dosa Dosa Dosa Dosa Dosa Dosa Dosa DosaDosaDosaDosaDosaDosa Dosa"
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NSNotification.Name(rawValue: "PassDataNotification"), object: nil)
        
        // Do any additional setup after loading the view.
    }

    @objc func handleNotification(_ notification: Notification) {
        if let data = notification.userInfo?["data"] as? String {
            print(data) // Output: "Hello, World!"
        }
        print("working")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
