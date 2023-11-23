//
//  ListTableViewCell.swift
//  RecipeApp
//
//  Created by Varun Sharma on 31/08/23.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //label1.text = "hi"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
