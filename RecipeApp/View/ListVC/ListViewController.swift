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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func continuePressed(_ sender: Any) {
        
        let vc = RecipeViewController()
        
        let notificationName = Notification.Name("PassDataNotification")
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["data": "Hello, World!"])

        navigationController?.pushViewController(vc, animated: true)
        
        
       // vc.self.recipeLabel.text = "hi"
        
    }
    
}


extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return confirmationModel.veggies.count
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
            if ((indexPath.row > confirmationModel.herbs.count) || (confirmationModel.herbs.count == 0) ){
                
                    cell.label1.text = "none"
            }
            
            else   {
                cell.label1.text = confirmationModel.herbs[indexPath.row]
                print(indexPath.row)
               
            }
          
            
            
        }
        
        else if indexPath.section == 2 {
            
            if ((indexPath.row >= confirmationModel.extra.count) || (confirmationModel.extra == nil)) {
                cell.label1.text = "none"
            }
            else {
                cell.label1.text = confirmationModel.extra[indexPath.row]
            }
          
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
