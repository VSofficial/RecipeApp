//
//  ListViewController.swift
//  RecipeApp
//
//  Created by Varun Sharma on 30/08/23.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var veggies = ["onion", "tomato", "potato"]
    var herbs = ["coriander", "mint", "curry leaves"]
    var extra = ["oil", "salt", "pepper leaves"]
    
    var sections = [["onion", "tomato", "potato"], ["coriander", "mint", "curry leaves"], ["oil", "salt", "pepper"]]
    
    
    @IBOutlet weak var btnContinue: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(confirmationModel)
        //print(confirmationModel.extra.first)
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "listCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }



    
    
    @IBAction func continuePressed(_ sender: Any) {
        
        let vc = RecipeVC()
        
        let notificationName = Notification.Name(rawValue: "PassDataNotification")
        
        NotificationCenter.default.post(Notification(name: notificationName, object: nil, userInfo: ["data": "Hello, World!"]))

        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
}


extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return confirmationModel.veggies.count
        }
        else if section == 1 {
            
            return confirmationModel.herbs.count
        }
        
        else if section == 2 {
            
            return confirmationModel.extra.count
        }
        
        return Int()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        
        print(confirmationModel)
        
        if indexPath.section == 0 {
            cell.label1.text = confirmationModel.veggies[indexPath.row]
           
        }
        
        else if indexPath.section == 1 {
          
                cell.label1.text = confirmationModel.herbs[indexPath.row]
                print(indexPath.row)
               
            
        }
        
        else if indexPath.section == 2 {
            
            
                cell.label1.text = confirmationModel.extra[indexPath.row]
            
          
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Vegitables"
        }
        
        else if section == 1 {
            return "Herbs"
        }
        
        else if section == 2 {
            return "Extras"
        }
        
        return String()
        
    }
}
