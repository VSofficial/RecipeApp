//
//  MainViewController.swift
//  RecipeApp
//
//  Created by Varun Sharma on 30/08/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button1: UIButton!
    
    
    
    @IBAction func navigateList(_ sender: Any) {
        print("pressed")
        
    
        if let nextViewController = ListViewController(nibName: "ListViewController", bundle: nil) as? ListViewController {
                    // Perform the transition
                    navigationController?.pushViewController(nextViewController, animated: true)
            print(nextViewController)
                }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        tableView.register(UINib(nibName: "Tcell2", bundle: nil), forCellReuseIdentifier: "tcell2")
        tableView.register(UINib(nibName: "Tcell3", bundle: nil), forCellReuseIdentifier: "Tcell3")
        tableView.dataSource = self
        tableView.delegate = self
        
        
           
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

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "tcell2", for: indexPath) as! Tcell2
            return cell
            
        }
        
        else if indexPath.row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Tcell3", for: indexPath) as! Tcell3
            return cell
            
        }
        
        
        else if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
            return cell
            
        }
        
        return UITableViewCell()
                
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
}
