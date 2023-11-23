//
//  CollectionViewCell.swift
//  RecipeApp
//
//  Created by Varun Sharma on 30/08/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var cellCount: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // cellCount.text = ""
        
        
        // Initialization code
    }

}
